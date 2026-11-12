import logging
import asyncio
import binascii
import time
import struct
from ipaddress import ip_network, ip_address
import protocol
import const
from cmd_alias import rewrite_cmd_out
import common

PUFFIN_SUB = ["107.178.32.0/20", "45.33.128.0/20", "101.127.206.0/23",
              "101.127.208.0/23"]


def is_puffin(ip):
    for net in PUFFIN_SUB:
        net = ip_network(net)
        if ip_address(ip) in net:
            return True
    return False


class Client():
    def __init__(self, server):
        self.server = server
        self.user_data = {}
        self.uid = None
        self.drop = False
        self.debug = False
        self.encrypted = False
        self.compressed = False
        self.checksummed = False
        self.room = ""
        self.position = (0, 0)
        self.dimension = 4
        self.state = 0
        self.action_tag = ""
        self.canyon_lid = None
        self.last_msg = time.time()
        self.last_activity_award = 0
        self.echo_cmd = None

    async def handle(self, reader, writer):
        self.reader = reader
        self.writer = writer
        self.addr = writer.get_extra_info('peername')[0]
        if not is_puffin(self.addr):
            self.user_data["ip_address"] = self.addr
        buffer = b""
        while True:
            await asyncio.sleep(0.2)
            try:
                data = await reader.read(1024)
            except OSError:
                break
            if not data:
                break
            data = protocol.BytesWithPosition(buffer+data)
            buffer = b""
            if data.hex() == "3c706f6c6963792d66696c652d726571756573742f3e00":
                writer.write(const.XML + b"\x00")
                await writer.drain()
                continue
            while len(data) - data.pos > 4:
                length = data.read_i32()
                if len(data) - data.pos < length:
                    data.pos = 0
                    break
                frame = data.read(length)
                try:
                    final_data = protocol.processFrame(frame, True)
                except Exception:
                    logging.error(
                        "processFrame failed uid=%s len=%s mask=%s hex=%s",
                        self.uid, length,
                        frame[0] if frame else None, frame.hex())
                    data.pos = len(data)
                    break
                if final_data:
                    _m = final_data.get("msg") or []
                    if final_data.get("type") == 34:
                        _desc = _m[1] if len(_m) > 1 else None
                    else:
                        _desc = _m[0] if len(_m) > 0 else None
                    logging.info(
                        "frame from %s uid=%s type=%s cmd=%s",
                        self.addr, self.uid, final_data.get("type"), _desc)
                    try:
                        await self.server.process_data(final_data, self)
                    except Exception as e:
                        logging.exception("Ошибка при обработке данных")
                else:
                    logging.warning("empty/invalid frame from %s", self.addr)
            if len(data) - data.pos > 0:
                buffer = data.read(len(data) - data.pos)
        await self._close_connection()

    async def send(self, msg, type_=34):
        if self.drop:
            return
        _out_cmd = None
        if isinstance(msg, list) and msg and isinstance(msg[0], str):
            msg = list(msg)
            _out_cmd = msg[0]
            if self.echo_cmd and _out_cmd.startswith("a.clths."):
                msg[0] = self.echo_cmd
                self.echo_cmd = None
            else:
                msg[0] = rewrite_cmd_out(msg[0])
        elif isinstance(msg, str):
            # Some callers wrongly pass the command as a bare string.
            _out_cmd = msg
            msg = [rewrite_cmd_out(msg)]
        logging.info("send-> uid=%s type=%s cmd=%s obf=%s", self.uid, type_,
                     _out_cmd, msg[0] if isinstance(msg, list) and msg else None)
        try:
            data = struct.pack(">b", type_)
            data += protocol.encodeArray(msg)
            data = self._make_header(data) + data
        except Exception:
            logging.exception("encode failed cmd=%s type=%s", _out_cmd, type_)
            return
        try:
            self.writer.write(data)
            await self.writer.drain()
        except (BrokenPipeError, ConnectionResetError, AssertionError,
                TimeoutError, OSError, AttributeError):
            self.writer.close()

    def _make_header(self, msg):
        header_length = 1
        mask = 0
        if self.encrypted:
            mask |= (1 << 1)
        if self.compressed:
            mask |= (1 << 2)
        if self.checksummed:
            mask |= (1 << 3)
            header_length += 4
        buf = struct.pack(">i", len(msg)+header_length)
        buf += struct.pack(">B", mask)
        if self.checksummed:
            buf += struct.pack(">I", binascii.crc32(msg))
        return buf

    async def _close_connection(self):
        self.drop = True
        self.writer.close()
        if self.uid:
            # Only tear down the shared game state if THIS socket is the one
            # registered as the online game connection. The parallel "account"
            # channel shares the same uid but is not registered in online, so it
            # must not evict the live game session when it closes.
            is_online_client = self.server.online.get(self.uid) is self
            if is_online_client:
                del self.server.online[self.uid]
                await self.server.redis.delete(f"uid:{self.uid}:online")
                if self.room:
                    prefix = common.get_prefix(self.room)
                    mod = self.server.modules.get(prefix)
                    if mod:
                        await mod.leave_room(self)
                if self.uid in self.server.inv:
                    self.server.inv[self.uid].expire = time.time()+30
                await self.server.redis.set(f"uid:{self.uid}:lvt",
                                            int(time.time()))
        del self
