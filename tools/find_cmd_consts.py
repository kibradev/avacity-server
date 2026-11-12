#!/usr/bin/env python3
from pathlib import Path
import re

root = Path("/opt/avacity/base/files/pnz-exported/scripts")
# Find classes that look like command-name constant holders with obfuscated prefixes
pat = re.compile(r'public static const \S+:String = ("[^"]+"|§_\S+§)(?: \+ ("[^"]+"))?;')
for p in root.rglob("*.as"):
    t = p.read_text(errors="ignore")
    if "public static const" not in t:
        continue
    if "#h" in t or 'String = "h.' in t or 'String = "o.' in t:
        hits = [line.strip() for line in t.splitlines() if "static const" in line and "String" in line]
        if hits:
            print(p.relative_to(root))
            for h in hits[:20]:
                print(" ", h)
            print()
