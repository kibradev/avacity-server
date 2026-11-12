#!/usr/bin/env python3
"""Find room-subcommand obfuscated constants by locating classes that build
on a '#bchYr' style room prefix, similar to §_-8uS§ house command holder."""
import os, re
root = "/opt/avacity/base/files/pnz-exported/scripts"
# We look for any .as containing literal tokens with '#' and '=' or the
# fragments 'bchYr'/'=chq', or classes concatenating a room prefix.
frag = ("bchYr", "=chq", "#$", "hfwRG2")
found = {}
for dp, _, files in os.walk(root):
    for f in files:
        if not f.endswith(".as"):
            continue
        p = os.path.join(dp, f)
        try:
            t = open(p, encoding="utf-8", errors="ignore").read()
        except Exception:
            continue
        for fr in frag:
            if fr in t:
                found.setdefault(p, set()).add(fr)

for p, frs in found.items():
    print(p, sorted(frs))
    # print lines with static const String or the fragment
    for i, line in enumerate(open(p, encoding="utf-8", errors="ignore")):
        if any(fr in line for fr in frag) or ("static const" in line and "String" in line):
            print("   %4d %s" % (i+1, line.rstrip()[:160]))
