#!/usr/bin/env python3
from pathlib import Path
needle = b"serverConnectionError"
ru = "Не удалось подключиться".encode("utf-8")
for p in Path("/opt/avacity/base/files").rglob("*.swf"):
    try:
        b = p.read_bytes()
    except Exception as e:
        continue
    if needle in b or ru in b:
        print("HIT", p, "key", needle in b, "ru", ru in b)
print("done")
