#!/usr/bin/env python3
import zipfile, re, pathlib

z = zipfile.ZipFile("/opt/avacity/base/files/data/config_all_ru_26881c5ec4cf06402fffac943bdbe37e.zip")
data = z.read("translation/dictionary_ru.xml")
pat = re.compile(rb'<message key="([^"]*(?:onnect|econnect|erverBusy|erverConnection)[^"]*)"')
for m in pat.finditer(data):
    key = m.group(1).decode()
    start = m.end()
    end = data.find(b"</message>", start)
    val = data[start:end].decode("utf-8", "replace")
    print(f"{key}\n  {val[:150].replace(chr(10),' ')}\n")

# find AS usages of serverConnectionError via raw file scan including binaries in export
root = pathlib.Path("/opt/avacity/base/files/pnz-exported")
needle = b"serverConnectionError"
for p in root.rglob("*"):
    if not p.is_file():
        continue
    if p.stat().st_size > 20_000_000:
        continue
    try:
        b = p.read_bytes()
    except Exception:
        continue
    if needle in b:
        print("FOUND_IN", p)
