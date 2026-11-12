#!/usr/bin/env python3
"""Scan pnz-city.swf for currentScreen / getRoomInfo / related class markers."""
import re
import sys

path = sys.argv[1] if len(sys.argv) > 1 else "files/pnz-city.swf"
data = open(path, "rb").read()
print("size", len(data), "path", path)

needles = [
    b"getRoomInfo",
    b"currentScreen",
    b"initLocation",
    b"processRoomConnectResult",
    b"-4GN",
    b"-6kZ",
    b"-CGQ",
    b"-3TJ",
    b"-3-x",
    b"-9nE",
    b"-4v6",
    b"-9PB",
    b"-72Y",
    b"-6PJ",
    b"leaveRoom",
]
for n in needles:
    idx = 0
    hits = 0
    while True:
        i = data.find(n, idx)
        if i < 0:
            break
        hits += 1
        start = max(0, i - 40)
        end = min(len(data), i + len(n) + 60)
        chunk = data[start:end]
        s = "".join(chr(b) if 32 <= b < 127 else "." for b in chunk)
        print(f"--- {n!r} @{i} ---")
        print(s)
        idx = i + 1
        if hits >= 6:
            break
    print(f"[{n.decode(errors='replace')}] first-batch hits={hits}")

# Also dump nearby ascii strings for getRoomInfo context
print("\n=== ascii strings near getRoomInfo ===")
for m in re.finditer(rb"getRoomInfo", data):
    i = m.start()
    window = data[max(0, i - 200) : i + 200]
    strings = re.findall(rb"[\x20-\x7e]{4,60}", window)
    for s in strings:
        print(" ", s.decode("latin1"))
