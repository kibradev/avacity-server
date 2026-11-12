#!/usr/bin/env python3
import zipfile, os
base = "/opt/avacity/base/files/data"
for name in ["config_all_ru_26881c5ec4cf06402fffac943bdbe37e.zip",
             "config_all_ru_d16d52961eade7f000a854ca8ec72c8d.zip"]:
    p = os.path.join(base, name)
    z = zipfile.ZipFile(p)
    print("="*70)
    print(name)
    data = z.read("avatarAppearance/appearance.xml").decode("utf-8", "ignore")
    print("appearance.xml len", len(data))
    print("first 1200 chars:")
    print(data[:1200])
    print("... contains 'boy'?", data.count("boy"), " 'girl'?", data.count("girl"))
