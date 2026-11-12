#!/usr/bin/env python3
import json, os, glob
base = "/opt/avacity/base/files"
vj = os.path.join(base, "versions.json")
try:
    d = json.load(open(vj))
    print("versions.json keys:", len(d))
    for k, v in d.items():
        kl = k.lower()
        if "config" in kl or "appearance" in kl or "clothes" in kl or k.endswith(".zip"):
            print("  ", k, "->", v)
except Exception as e:
    print("versions.json err", e)

print("=== data/ config files ===")
for p in sorted(glob.glob(os.path.join(base, "data", "*config*"))):
    print("  ", os.path.basename(p), os.path.getsize(p))
print("=== data/ all ===")
for p in sorted(glob.glob(os.path.join(base, "data", "*")))[:40]:
    print("  ", os.path.basename(p), os.path.getsize(p))
