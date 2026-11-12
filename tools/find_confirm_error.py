#!/usr/bin/env python3
"""Find confirm(error, ...) dialogs and ConnectionError string fragments."""
from pathlib import Path
import re

root = Path("/opt/avacity/base/files/pnz-exported/scripts")
needles = [
    b"ConnectionError",
    b"serverConnection",
    b"ConnectionErr",
    b"onnectionError",
]

# binary search in all exported
export = Path("/opt/avacity/base/files/pnz-exported")
for p in export.rglob("*"):
    if not p.is_file() or p.stat().st_size > 5_000_000:
        continue
    try:
        b = p.read_bytes()
    except Exception:
        continue
    for n in needles:
        if n in b:
            print("BIN", p, n)

# confirm with error title
for p in root.rglob("*.as"):
    t = p.read_text(errors="ignore")
    if "confirm(" not in t:
        continue
    lines = t.splitlines()
    for i, line in enumerate(lines):
        if "confirm(" not in line:
            continue
        # multiline confirm
        block = "\n".join(lines[i:min(len(lines), i+15)])
        if 'message("error")' in block or "message('error')" in block:
            print("=" * 50)
            print(p)
            print(block[:500])
            print()

# Also search message keys built from pieces
for p in root.rglob("*.as"):
    t = p.read_text(errors="ignore")
    if "Connection" in t or "connection" in t:
        for i, line in enumerate(t.splitlines(), 1):
            if re.search(r"connect|Connect|serverBusy|reconnect", line, re.I):
                if "message(" in line or "B5P" in line or "confirm" in line or "AlJ" in line:
                    print(f"HIT {p}:{i}: {line.strip()[:160]}")
