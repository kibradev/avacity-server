#!/usr/bin/env python3
import zipfile, re
z = zipfile.ZipFile("/opt/avacity/base/files/data/config_all_ru_26881c5ec4cf06402fffac943bdbe37e.zip")
needle = "Не удалось подключиться".encode()
for name in z.namelist():
    data = z.read(name)
    if needle not in data:
        continue
    print("file", name)
    idx = data.find(needle)
    print(data[max(0, idx - 120): idx + 160].decode("utf-8", "replace"))
    # find key attribute before CDATA
    chunk = data[max(0, idx - 300): idx]
    for m in re.finditer(rb'([A-Za-z0-9_]*[Cc]onnection[A-Za-z0-9_]*)', chunk):
        print("near", m.group(1).decode())
