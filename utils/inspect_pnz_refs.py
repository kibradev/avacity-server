import re
import zlib
from pathlib import Path

files = [
    Path("/opt/avacity/base/files/pnz-city.swf"),
    Path("/opt/avacity/base/files/pnz-city.original.swf"),
    Path("/opt/avacity/base/files/pnz-city-container.swf"),
]

for path in files:
    print("====", path.name)
    if not path.exists():
        print("MISSING")
        continue
    raw = path.read_bytes()
    body = zlib.decompress(raw[8:]) if raw[:3] == b"CWS" else raw
    print("count", body.count(b"pnz-city.project"))
    for match in re.finditer(rb".{0,70}pnz-city\.project.{0,70}", body):
        print(match.group(0).decode("latin1", "replace"))
