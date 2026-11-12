#!/usr/bin/env python3
import json, os, glob, subprocess

d = json.load(open("/opt/avacity/base/files/versions.json"))
needles = ("appear", "avatar", "create", "gender", "passport", "boy", "girl")
ks = sorted(k for k in d if any(x in k.lower() for x in needles))
print("MATCH", len(ks), "TOTAL", len(d))
for k in ks[:120]:
    print(k)

base = "/opt/avacity/base/files"
print("--- existence ---")
for pat in ("AvatarAppearance*", "BoyAvatarClothes*", "GirlAvatarClothes*",
            "*Create*", "*Gender*", "*Passport*", "AppearanceIcons*", "AvatarIcons*"):
    hits = glob.glob(os.path.join(base, "swf", "**", pat), recursive=True)
    print(pat, "->", [h[len(base)+1:] for h in hits[:15]])

print("--- web.log tail ---")
try:
    with open("/tmp/web.log") as f:
        lines = f.readlines()
    print("lines", len(lines))
    for line in lines[-80:]:
        print(line.rstrip())
except Exception as e:
    print("web log err", e)

print("--- server.log last 30 ---")
with open("/tmp/server.log") as f:
    lines = f.readlines()
for line in lines[-30:]:
    print(line.rstrip())
