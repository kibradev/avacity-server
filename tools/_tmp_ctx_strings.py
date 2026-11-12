#!/usr/bin/env python3
import re
data = open("/opt/avacity/base/files/pnz-city.swf", "rb").read()
# Find ASCII string runs
strings = []
for m in re.finditer(rb'[\x20-\x7e]{2,40}', data):
    strings.append((m.start(), m.group().decode('latin1')))

# locate anchors
for anchor in ["#$=chq", "#bchYr"]:
    print("="*60)
    print("ANCHOR", anchor)
    idxs = [i for i,(off,s) in enumerate(strings) if s == anchor]
    if not idxs:
        # substring
        idxs = [i for i,(off,s) in enumerate(strings) if anchor in s]
    for idx in idxs[:3]:
        print(f"-- occurrence at string index {idx}, offset {strings[idx][0]} --")
        for j in range(max(0, idx-14), min(len(strings), idx+15)):
            mark = " <<<" if j == idx else ""
            print(f"   [{j}] {strings[j][1]!r}{mark}")
