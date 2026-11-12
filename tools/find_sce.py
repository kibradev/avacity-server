#!/usr/bin/env python3
from pathlib import Path
import zipfile
import re

ru = "Не удалось подключиться к серверу".encode("utf-8")
keys = [b"serverConnectionError", b"tryReconnectError", b"serverBusy", b"lagReconnect"]

base = Path("/opt/avacity/base")
for p in [
    base / "files/pnz-city.swf",
    base / "files/pnz-city.swf.bak",
]:
    if p.exists():
        b = p.read_bytes()
        for k in keys + [ru]:
            print(p.name, k[:40], "->", b.find(k))

# dictionary text for the key
zips = list((base / "files/data").glob("config_all_ru_*.zip"))
print("zips", len(zips))
for zp in zips[:3]:
    with zipfile.ZipFile(zp) as z:
        data = z.read("translation/dictionary_ru.xml")
    for key in [b"serverConnectionError", b"tryReconnectError", b"serverBusy"]:
        i = data.find(b'key="' + key + b'"')
        if i < 0:
            print(zp.name, key, "missing")
            continue
        end = data.find(b"</message>", i)
        print(zp.name, data[i:end].decode("utf-8", "replace")[:200].replace("\n", " | "))

# Search confirm() with message keys related to connect in AS
root = Path("/opt/avacity/base/files/pnz-exported/scripts")
pat = re.compile(r'confirm\([^)]*message\("([^"]+)"\)[^)]*message\("([^"]+)"\)', re.S)
pat2 = re.compile(r'§_-AlJ§\([^)]*message\("([^"]+)"\)[^)]*message\("([^"]+)"\)', re.S)
for p in root.rglob("*.as"):
    t = p.read_text(errors="ignore")
    if "confirm" not in t and "AlJ" not in t:
        continue
    for m in pat.finditer(t):
        a, b = m.group(1), m.group(2)
        if any(x in (a + b).lower() for x in ("connect", "server", "reconnect", "busy", "network", "socket")):
            print("CONFIRM", p, a, b)
    for m in pat2.finditer(t):
        a, b = m.group(1), m.group(2)
        if any(x in (a + b).lower() for x in ("connect", "server", "reconnect", "busy", "network", "socket")):
            print("AlJ", p, a, b)

# Also find any message("server...") 
for p in root.rglob("*.as"):
    t = p.read_text(errors="ignore")
    for m in re.finditer(r'message\("(server[^"]*)"\)', t):
        print("MSG", p.relative_to(root), m.group(1))
