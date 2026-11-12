#!/usr/bin/env python3
import json, urllib.request
d = json.load(urllib.request.urlopen("http://127.0.0.1/files/versions.json"))
for k in ("swf/AvatarAppearance.swf","swf/BoyAvatarClothes.swf","swf/GirlAvatarClothes.swf","swf/AvatarIcons.swf","abz/AvatarAppearance.abz"):
    h = d.get(k)
    print(k, "->", h)
    if h:
        # common URL patterns
        base, ext = k.rsplit(".", 1)
        candidates = [
            f"/files/{base}_{h}.{ext}",
            f"/files/{k}?{h}",
            f"/files/{k}",
        ]
        for c in candidates:
            try:
                r = urllib.request.urlopen("http://127.0.0.1"+c)
                print(" ", c, r.status, r.headers.get("Content-Length"))
            except Exception as e:
                print(" ", c, "FAIL", e)
