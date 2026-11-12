#!/usr/bin/env python3
import os, re
root = "/opt/avacity/base/files/pnz-exported/scripts"
lit = re.compile(r'static const \S+:String = ("#[^"]*"|§\S+§ \+ "[^"]*"|"[^"]*")')
for dp, _, files in os.walk(root):
    for f in files:
        if not f.endswith(".as"):
            continue
        p = os.path.join(dp, f)
        t = open(p, encoding="utf-8", errors="ignore").read()
        # count constants whose value string starts with '#'
        consts = re.findall(r'static const \S+:String\s*=\s*(?:§\S+§ \+ )?"(#[^"]*)"', t)
        # also constants concatenated to a base that itself is '#..'
        if len(consts) >= 3:
            print("===", os.path.relpath(p, root), "count", len(consts))
            for c in consts[:25]:
                print("   ", c)
