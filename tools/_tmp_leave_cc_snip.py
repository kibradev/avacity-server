#!/usr/bin/env python3
"""Find leave-room payload parsing / cc usage near lv handlers."""
from pathlib import Path
root = Path("/opt/avacity/base/files/pnz-exported/scripts")
# search for files mentioning leave + cc nearby
hits = []
for p in root.rglob("*.as"):
    try:
        t = p.read_text(encoding="utf-8", errors="ignore")
    except Exception:
        continue
    if "onLeaveRoom" in t or "1cS" in t or "leavedRoom" in t:
        # print snippets with cc
        lines = t.splitlines()
        for i, line in enumerate(lines):
            if "cc" in line.lower() or "Leave" in line or "leave" in line or "memberId" in line:
                if "onLeave" in line or "memberId" in line or '"cc"' in line or "cc" == line.strip() or ".cc" in line or "put(" in line and "cc" in line:
                    start = max(0, i - 2)
                    end = min(len(lines), i + 3)
                    hits.append((str(p), i + 1, "\n".join(lines[start:end])))
print("snippet hits", len(hits))
for path, ln, snip in hits[:40]:
    print(f"--- {path}:{ln} ---")
    print(snip)
    print()

# Also find net manager parsing of lv payload
print("=== files with both lv and uid ===")
n = 0
for p in root.rglob("*.as"):
    t = p.read_text(encoding="utf-8", errors="ignore")
    if ("#hztdMS" in t or "onLeaveRoom" in t) and ("uid" in t):
        print(p)
        n += 1
        if n > 15:
            break
