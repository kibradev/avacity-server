#!/usr/bin/env python3
import os, re
root = "/opt/avacity/base/files/pnz-exported/scripts"
pat = re.compile(r'#hfwRG2|#bchYr|#\$=chq|r\.info|"info"')
# search for string constants that look like obfuscated suffixes
pat2 = re.compile(r'String\s*=\s*("[^"]+"|§[^;]+)')
hits = []
for dirpath, _, files in os.walk(root):
    for f in files:
        if not f.endswith(".as"):
            continue
        path = os.path.join(dirpath, f)
        try:
            text = open(path, encoding="utf-8", errors="ignore").read()
        except Exception:
            continue
        if "#bchYr" in text or "#$=chq" in text or ("#hfwRG2" in text and "bch" in text):
            hits.append(path)
        # look for constants with # in string near r. or room
        if "§_-3Bs§" in text or "#hfwRG2" in text:
            hits.append("CONST:"+path)

print("hits", len(hits))
for h in hits[:30]:
    print(h)
