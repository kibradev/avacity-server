#!/usr/bin/env python3
from pathlib import Path
root = Path("/opt/avacity/base/files/pnz-exported/scripts")
needles = [
    "function getRoomInfo",
    "getRoomInfo(",
    "§_-CYz§",
    "class §_-72Y",
    "class §_-E1",
    "extends §_-3-x",
    "§_-3-x§",
]
for pat in needles:
    print("==", pat)
    n = 0
    for p in root.rglob("*.as"):
        try:
            t = p.read_text(encoding="utf-8", errors="ignore")
        except Exception:
            continue
        if pat in t:
            print(" ", p)
            n += 1
            if n >= 12:
                break
    if n == 0:
        print("  (none)")

# file sizes for key classes
for rel in [
    "§_-3hC§/§_-3-x§.as",
    "§_-07O§/§_-9PB§.as",
    "§_-7nb§/§_-B00§.as",
    "§_-7nb§/§_-6kZ§.as",
]:
    p = root / rel
    print("size", rel, p.stat().st_size if p.exists() else "MISSING")
