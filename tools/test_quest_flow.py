#!/usr/bin/env python3
"""Smoke-test automatic level quest activation through the live protocol."""

import asyncio

from test_outside_flow import (HOST, PORT, UID, pack_to_server,
                               read_from_server)


async def main():
    reader, writer = await asyncio.open_connection(HOST, PORT)
    writer.write(pack_to_server(1, ["street", UID, ""]))
    await writer.drain()
    auth = await read_from_server(reader)
    assert auth.get("type") == 1, auth

    writer.write(pack_to_server(34, [None, "q.get", {}], msgnum=2))
    await writer.drain()
    for _ in range(12):
        frame = await read_from_server(reader)
        msg = frame.get("msg") or []
        if "q.get" not in msg:
            continue
        payload = next(part for part in msg if isinstance(part, dict))
        qids = sorted(quest["qid"] for quest in payload["qc"]["q"])
        assert "q31" in qids and "q6" in qids, qids
        print("live quest flow passed; active:", ", ".join(qids))
        writer.close()
        await writer.wait_closed()
        return
    raise AssertionError("q.get response not received")


if __name__ == "__main__":
    asyncio.run(main())
