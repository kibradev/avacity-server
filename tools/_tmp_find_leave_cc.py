#!/usr/bin/env python3
from pathlib import Path
root = Path("/opt/avacity/base/files/pnz-exported/scripts")
for pat in ["onLeaveRoom", "#hztdMS", 'getObject("cc")', 'get("cc")', '["cc"]', ".cc"]:
    print("==", pat)
    n = 0
    for p in root.rglob("*.as"):
        try:
            t = p.read_text(encoding="utf-8", errors="ignore")
        except Exception:
            continue
        if pat in t:
            # for noisy .cc, require leave context
            if pat == ".cc" and "Leave" not in t and "leave" not in t and "lv" not in t:
                continue
            print(" ", p)
            n += 1
            if n >= 20:
                break
    if not n:
        print("  (none)")
