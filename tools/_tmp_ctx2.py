#!/usr/bin/env python3
import re, zlib
raw = open("/opt/avacity/base/files/pnz-city.swf", "rb").read()
data = b"FWS" + raw[3:8] + zlib.decompress(raw[8:])

strings = []
for m in re.finditer(rb'[\x20-\x7e]{2,48}', data):
    strings.append((m.start(), m.group().decode('latin1')))

for anchor in ["#$=chq", "#bchYr"]:
    print("="*60)
    print("ANCHOR", anchor)
    for idx,(off,s) in enumerate(strings):
        if s == anchor or anchor in s:
            for j in range(max(0, idx-25), min(len(strings), idx+30)):
                mark = " <<<" if strings[j][1]==anchor else ""
                print(f"   [{j}] {strings[j][1]!r}{mark}")
            print("----")
            break
