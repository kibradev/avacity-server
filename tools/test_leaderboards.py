#!/usr/bin/env python3
"""Live protocol smoke test for all leaderboard families."""
import asyncio
import binascii
import struct
import sys

sys.path.insert(0, "/opt/avacity/base")
import protocol

HOST = "127.0.0.1"
PORT = 8123
UID = "31"


def pack(msg_type, msg, msgnum=1):
    body = struct.pack(">i", msgnum)
    body += struct.pack(">b", msg_type) + protocol.encodeArray(msg)
    frame = struct.pack(">B", 1 << 3)
    frame += struct.pack(">I", binascii.crc32(body)) + body
    return struct.pack(">i", len(frame)) + frame


async def read_frame(reader, timeout=5):
    length = struct.unpack(">i", await asyncio.wait_for(
        reader.readexactly(4), timeout))[0]
    data = await asyncio.wait_for(reader.readexactly(length), timeout)
    return protocol.processFrame(data, client=False)


async def request(reader, writer, command, payload=None, msgnum=1):
    writer.write(pack(34, [None, command, payload or {}], msgnum))
    await writer.drain()
    for _ in range(20):
        frame = await read_frame(reader)
        if frame.get("type") != 34:
            continue
        message = frame.get("msg") or []
        if command in message:
            return next((value for value in message
                         if isinstance(value, dict)), {})
    raise AssertionError(f"no response for {command}")


async def main():
    reader, writer = await asyncio.open_connection(HOST, PORT)
    writer.write(pack(1, ["street", UID, ""]))
    await writer.drain()
    auth = await read_frame(reader)
    assert auth.get("type") == 1, auth

    active = await request(reader, writer, "ur.gar", msgnum=2)
    assert active.get("bt"), active
    assert all(isinstance(uid, int) for uid in active["bt"]), active

    honor = await request(reader, writer, "ur.get", msgnum=3)
    assert honor.get("bt"), honor
    assert {"uid", "hr", "cr"} <= set(honor["bt"][0]), honor

    clans = await request(reader, writer, "ca.gcart", msgnum=4)
    assert clans.get("cartuids"), clans
    assert all(isinstance(cid, int) for cid in clans["cartuids"]), clans

    competitions = await request(reader, writer, "ctmr.get", msgnum=5)
    tops = competitions.get("tu", {})
    expected = {"snowboardRating", "hockeyRating",
                "singleDancers", "duelDancers"}
    assert expected <= set(tops), tops
    assert all(tops[name] for name in expected), tops

    winners = await request(reader, writer, "ctmr.gwn", {"ctp": 2}, 6)
    assert winners.get("ctp") == 2, winners
    assert winners.get("tu"), winners
    assert {"uid", "cr", "ct", "cid"} <= set(winners["tu"][0]), winners

    print("active:", active["bt"][:5])
    print("honor:", honor["bt"][:3])
    print("clans:", clans["cartuids"][:5])
    print("competitions:", {key: value[:5] for key, value in tops.items()})
    print("snow winners:", winners["tu"][:3])
    print("OK")
    writer.close()
    await writer.wait_closed()


if __name__ == "__main__":
    asyncio.run(main())
