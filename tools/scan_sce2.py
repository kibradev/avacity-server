#!/usr/bin/env python3
from pathlib import Path
import zlib

swf = Path("/opt/avacity/base/files/pnz-city.swf").read_bytes()
print("sig", swf[:3], "len", len(swf))
pieces = [
    b"serverConnection",
    b"ConnectionError",
    b"serverCon",
    b"nectError",
    b"serverBusy",
    b"tryReconnect",
    b"lagReconnect",
    b"connectError",
    b"serverConnectionError",
]
for p in pieces:
    print(repr(p), swf.find(p))

# Decompress whole CWS if needed
body = swf
if swf[:3] == b"CWS":
    body = swf[:8] + zlib.decompress(swf[8:])
    print("decompressed", len(body))
    for p in pieces:
        print("dec", repr(p), body.find(p))
elif swf[:3] == b"ZWS":
    print("ZWS lzma - skip full decompress for now")

# Search all config / data for who references the key besides dictionary
for p in Path("/opt/avacity/base").rglob("*"):
    if not p.is_file():
        continue
    if p.suffix.lower() in {".pyc", ".png", ".jpg", ".mp3", ".ogg"}:
        continue
    if p.stat().st_size > 30_000_000:
        continue
    try:
        b = p.read_bytes()
    except Exception:
        continue
    if b"serverConnectionError" in b:
        print("FOUND", p)
