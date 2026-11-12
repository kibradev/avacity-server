#!/usr/bin/env python3
"""Find AS files that likely show serverConnectionError dialog."""
import pathlib, re

root = pathlib.Path("/opt/avacity/base/files/pnz-exported/scripts")
for p in root.rglob("*.as"):
    t = p.read_text(errors="ignore")
    # B5P with error title
    if 'message("error")' not in t and "message('error')" not in t:
        continue
    if "B5P" not in t:
        continue
    # look for B5P lines with error
    for i, line in enumerate(t.splitlines(), 1):
        if "B5P" in line and "error" in line:
            # print surrounding
            lines = t.splitlines()
            ctx = "\n".join(f"{j}: {lines[j-1]}" for j in range(max(1,i-2), min(len(lines), i+3)+1))
            # filter interesting
            block = "\n".join(lines[max(0,i-5):i+8])
            if any(k in block for k in [
                "Connect", "connect", "server", "Socket", "netClient",
                "6gl", "reconnect", "login", "auth", "AlJ", "Busy",
            ]):
                print("=" * 60)
                print(p)
                print(ctx)
                print()
