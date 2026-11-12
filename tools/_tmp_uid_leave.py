#!/usr/bin/env python3
from pathlib import Path
root = Path("/opt/avacity/base/files/pnz-exported/scripts")
# Find parsing of leave/jn/info payloads - look for memberId assignment from uid
for p in root.rglob("*.as"):
    t = p.read_text(encoding="utf-8", errors="ignore")
    if '"uid"' in t and ("1cS" in t or "Leave" in t or "leaveRoom" in t or "CDg" in t or "getRoomInfo" in t or "#$=chq" in t or "bchYr" in t):
        print(p)
        # show lines with uid/cc
        for i, line in enumerate(t.splitlines(), 1):
            if "uid" in line or "cc" in line or "memberId" in line or "1cS" in line or "CDg" in line:
                if i < 400 or "uid" in line or "cc" in line:
                    print(f"  {i}:{line[:160]}")
        print()
