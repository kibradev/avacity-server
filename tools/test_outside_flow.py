#!/usr/bin/env python3
"""Smoke-test an outside zone room join + room info round-trip."""
import asyncio
import binascii
import struct
import sys

sys.path.insert(0, "/opt/avacity/base")
import protocol

HOST = "127.0.0.1"
PORT = 8123
UID = "31"
ZONE = "street"
ROOMS = {
    "cafe": "cf1",
    "club": "cl1",
    "park": "p1",
    "street": "s1",
    "publicBeach": "pb1",
    "ballroom": "br1",
    "canyon": "pc1",
}
LOCATION = sys.argv[1] if len(sys.argv) > 1 else "publicBeach"
GROUP = ROOMS.get(LOCATION)
if GROUP is None:
    raise SystemExit(f"unknown location {LOCATION!r}; choose from {sorted(ROOMS)}")


def pack_to_server(msg_type, msg, checksummed=True, msgnum=1):
    """Frames the server expects from Flash (processFrame(..., client=True))."""
    body = struct.pack(">i", msgnum)  # message number skipped when client=True
    body += struct.pack(">b", msg_type)
    body += protocol.encodeArray(msg)
    mask = (1 << 3) if checksummed else 0
    frame = struct.pack(">B", mask)
    if checksummed:
        frame += struct.pack(">I", binascii.crc32(body))
    frame += body
    return struct.pack(">i", len(frame)) + frame


async def read_from_server(reader, timeout=5.0):
    """Server outbound frames have no message number (client=False)."""
    length_b = await asyncio.wait_for(reader.readexactly(4), timeout)
    length = struct.unpack(">i", length_b)[0]
    rest = await asyncio.wait_for(reader.readexactly(length), timeout)
    return protocol.processFrame(rest, client=False)


async def main():
    print("connecting", HOST, PORT, flush=True)
    reader, writer = await asyncio.open_connection(HOST, PORT)
    writer.write(pack_to_server(1, [ZONE, UID, ""]))
    await writer.drain()
    try:
        auth = await read_from_server(reader)
    except Exception as e:
        print("auth failed:", type(e).__name__, e, flush=True)
        return 1
    print("auth:", auth, flush=True)
    if not auth or auth.get("type") != 1:
        print("auth rejected", flush=True)
        return 1

    writer.write(pack_to_server(
        34, ["", "o.gr", {"lid": LOCATION, "gid": GROUP}]))
    await writer.drain()
    gr = None
    room_id = None
    # join_room may also emit o.r.jn (to self / peers) before o.gr ack
    for _ in range(8):
        try:
            frame = await read_from_server(reader)
        except Exception as e:
            print("o.gr read failed:", type(e).__name__, e, flush=True)
            return 1
        print("frame:", frame.get("type"), frame.get("msg") and frame["msg"][:2], flush=True)
        if frame.get("type") != 34 or not frame.get("msg"):
            continue
        cmd = frame["msg"][0] if isinstance(frame["msg"][0], str) else (
            frame["msg"][1] if len(frame["msg"]) > 1 else None)
        # outbound rewrite may put cmd at [0] or keep classic shape
        msgs = frame["msg"]
        cmds = [x for x in msgs if isinstance(x, str)]
        print("  cmds:", cmds, flush=True)
        if any(c.endswith(".gr") or c == "o.gr" or c.endswith("gr") for c in cmds):
            gr = frame
            # payload dict with rid
            for part in msgs:
                if isinstance(part, dict) and "rid" in part:
                    room_id = part["rid"]
                    break
            break
        # also accept classic ["", "o.gr", {...}] shape if ever unaliased
        if len(msgs) >= 3 and isinstance(msgs[1], str) and msgs[1].endswith(".gr"):
            gr = frame
            room_id = msgs[2].get("rid")
            break
    if not room_id:
        print("FAIL: no o.gr rid; last=", gr, flush=True)
        return 1
    print("room_id:", room_id, flush=True)

    writer.write(pack_to_server(
        34, [room_id, "o.#bchYr.#$=chq", {"rid": GROUP}]))
    await writer.drain()
    info = None
    for _ in range(8):
        try:
            frame = await read_from_server(reader)
        except Exception as e:
            print("o.r.info read failed:", type(e).__name__, e, flush=True)
            return 1
        print("info-frame:", frame.get("type"), flush=True)
        msgs = frame.get("msg") or []
        cmds = [x for x in msgs if isinstance(x, str)]
        print("  cmds:", cmds, flush=True)
        if any("chq" in c or c.endswith(".info") for c in cmds):
            info = frame
            break
    if not info:
        print("FAIL: no o.r.info", flush=True)
        return 1
    msgs = info["msg"]
    # cmd may be at [0] (rewritten) or [1]
    cmd = msgs[0] if isinstance(msgs[0], str) and ("chq" in msgs[0] or ".info" in msgs[0]) else msgs[1]
    payload = next((p for p in msgs if isinstance(p, dict)), {})
    print("o.r.info cmd:", cmd, flush=True)
    print("members:", len(payload.get("rmmb", [])), flush=True)
    print("keys:", sorted(payload.keys()) if isinstance(payload, dict) else None, flush=True)
    if isinstance(payload, dict) and payload.get("rmmb"):
        m0 = payload["rmmb"][0]
        print("m0 keys:", sorted(m0.keys()) if isinstance(m0, dict) else None, flush=True)
    expected = "o.#bchYr.#$=chq"
    if cmd != expected:
        print("FAIL expected", expected, "got", cmd, flush=True)
        return 1

    # Walking is a separate room command from the absolute avatar-state
    # update.  The client sends a path segment with no x/y/st/d fields.
    movement = {"uid": UID, "sx": 17.34, "sy": 4.16,
                "dx": 18.75, "dy": 8.31}
    writer.write(pack_to_server(
        34, [room_id, "o.#bchYr.#bQT2uo", movement], msgnum=2))
    await writer.drain()
    movement_echo = None
    for _ in range(8):
        try:
            frame = await read_from_server(reader)
        except Exception as e:
            print("o.r.m read failed:", type(e).__name__, e, flush=True)
            return 1
        msgs = frame.get("msg") or []
        cmds = [x for x in msgs if isinstance(x, str)]
        if any("cp.ms.rsm" in c for c in cmds):
            print("FAIL: movement produced error modal", msgs, flush=True)
            return 1
        if any("#bQT2uo" in c or c.endswith(".m") for c in cmds):
            movement_echo = frame
            break
    if not movement_echo:
        print("FAIL: no movement echo", flush=True)
        return 1
    print("movement: OK", flush=True)
    print("OK", flush=True)
    writer.close()
    return 0


if __name__ == "__main__":
    raise SystemExit(asyncio.run(main()))
