#!/usr/bin/env python3
import json, os, urllib.request

d = json.load(open("/opt/avacity/base/files/versions.json"))
# Check critical UI assets for create-avatar flow
keys = [
    "swf/Ui.swf", "swf/UiInit.swf", "swf/UiLang_ru.swf",
    "swf/AvatarAppearance.swf", "swf/AvatarIcons.swf",
    "swf/AppearanceIcons.swf", "swf/AvatarAnimation.swf",
    "swf/BoyAvatarClothes.swf", "swf/GirlAvatarClothes.swf",
    "data/config_all_ru.zip",
]
base = "/opt/avacity/base/files"
for k in keys:
    h = d.get(k)
    if not h:
        print("MISSING VERSION", k)
        continue
    stem, ext = k.rsplit(".", 1)
    path = f"{base}/{stem}_{h}.{ext}"
    ok = os.path.exists(path)
    print(("OK" if ok else "MISSING FILE"), path, "size=", os.path.getsize(path) if ok else 0)

# Also check if unhashed symlink/copy would help
print("--- Ui* files on disk ---")
import glob
for p in sorted(glob.glob(base + "/swf/Ui*"))[:20]:
    print(p, os.path.getsize(p))
