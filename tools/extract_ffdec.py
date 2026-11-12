#!/usr/bin/env python3
import zipfile
from pathlib import Path

base = Path(__file__).resolve().parent
zf = base / "ffdec.zip"
out = base / "ffdec"
out.mkdir(exist_ok=True)
with zipfile.ZipFile(zf) as z:
    z.extractall(out)
print("extracted to", out)
for p in sorted(out.iterdir())[:30]:
    print(p.name)
