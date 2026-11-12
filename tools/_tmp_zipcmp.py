#!/usr/bin/env python3
import zipfile, os
base = "/opt/avacity/base/files/data"
for name in ["config_all_ru_26881c5ec4cf06402fffac943bdbe37e.zip",
             "config_all_ru_d16d52961eade7f000a854ca8ec72c8d.zip",
             "config_all_en_684cafb3ea2c92aecefd9b025c10d2f0.zip"]:
    p = os.path.join(base, name)
    print("="*70)
    print(name, os.path.getsize(p))
    try:
        z = zipfile.ZipFile(p)
        infos = z.infolist()
        print("  entries:", len(infos))
        for i in infos[:25]:
            print("   ", i.filename, "raw", i.file_size, "comp", i.compress_size)
        # total uncompressed
        tot = sum(i.file_size for i in infos)
        print("  total uncompressed:", tot)
    except Exception as e:
        print("  ERR", e)
