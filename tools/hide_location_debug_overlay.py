#!/usr/bin/env python3
"""Make the temporary 4v6 debug TextField zero-sized.

This is a length-preserving AVM2 bytecode patch.  It deliberately leaves the
method signature and control flow untouched; recompiling the obfuscated class
changes protected namespaces and can make the client fail during startup.
"""
from pathlib import Path
import struct
import sys
import zlib


if len(sys.argv) != 3:
    raise SystemExit("usage: hide_location_debug_overlay.py INPUT OUTPUT")

source = Path(sys.argv[1])
destination = Path(sys.argv[2])
raw = source.read_bytes()
if raw[:3] != b"CWS":
    raise SystemExit("refusing patch: expected a zlib-compressed CWS file")

body = zlib.decompress(raw[8:])

# Collapse the debug TextField to 0x0.  `pushbyte 0; nop` has the same length
# as each original `pushshort`, so ABC offsets, namespaces and method metadata
# remain unchanged.
patches = (
    (bytes.fromhex("25ec0461c3b907"), bytes.fromhex("24000261c3b907")),  # width 620 -> 0
    (bytes.fromhex("25900361c4b907"), bytes.fromhex("24000261c4b907")),  # height 400 -> 0
)
for needle, replacement in patches:
    count = body.count(needle)
    if count != 1:
        raise SystemExit(
            f"refusing patch: expected one debug field assignment, found {count}"
        )
    body = body.replace(needle, replacement, 1)

header = raw[:4] + struct.pack("<I", len(body) + 8)
destination.write_bytes(header + zlib.compress(body, level=9))
print(f"patched {source} -> {destination}")
