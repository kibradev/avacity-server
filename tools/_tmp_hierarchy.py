#!/usr/bin/env python3
from pathlib import Path
root = Path("/opt/avacity/base/files/pnz-exported/scripts")
# Who extends 9PB / 6PJ / 3-x / VC
for base in ["§_-9PB§", "§_-6PJ§", "§_-3-x§", "§_-Eb§", "§_-VC§"]:
    print("== extends", base)
    for p in root.rglob("*.as"):
        t = p.read_text("utf-8", "ignore")
        if f"extends {base}" in t:
            print(" ", p)

# factory mentioning publicBeach or 4v6 or CYz
print("== factory-ish")
for pat in ["publicBeach", "§_-4v6§", "new §_-3-x", "new §_-9PB", "new §_-1LL"]:
    print("--", pat)
    n=0
    for p in root.rglob("*.as"):
        t=p.read_text("utf-8","ignore")
        if pat in t:
            print(" ", p)
            n+=1
            if n>=8: break
