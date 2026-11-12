#!/usr/bin/env python3
from pathlib import Path
root = Path("/opt/avacity/base/files/pnz-exported/scripts")
# Find where leave event builds memberId from uid / cc
for pat in ['§_-1cS§', 'memberId', '"uid"', "put(§_-3Ys§", "§_-3Ys§"]:
    print("==", pat)
    n=0
    for p in root.rglob("*.as"):
        t=p.read_text("utf-8","ignore")
        if pat not in t:
            continue
        # prefer files that also mention leave or 1cS
        if pat in ('"uid"', 'memberId') and '1cS' not in t and 'Leave' not in t and 'leave' not in t:
            continue
        print(" ", p)
        n+=1
        if n>=12:
            break

# Print E1-like files in 6GW package parent mentions from tools dumps
print("=== search C9t / E1 filenames ===")
for p in root.rglob("*"):
    name=p.name
    if "C9t" in name or "E1" == name.replace(".as","") or name.endswith("E1§.as") or "E1§" in name:
        print(p)
