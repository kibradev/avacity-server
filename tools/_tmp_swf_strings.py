#!/usr/bin/env python3
"""Extract house-related obfuscated command strings from SWF."""
import re, sys
paths = [
    "/opt/avacity/base/files/pnz-city.swf",
    "/opt/avacity/base/files/pnz-city.patched.swf",
    "/opt/avacity/base/files/pnz-city.original.swf",
]
pat = re.compile(rb'[#a-zA-Z0-9_$.=]{3,40}')
needles = (b'#hfwRG2', b'#bchYr', b'#$=chq', b'#hBEILp', b'#hQcXSp')
for path in paths:
    try:
        data = open(path, 'rb').read()
    except FileNotFoundError:
        continue
    print("===", path, "size", len(data))
    # find ascii strings containing #
    strings = set()
    for m in re.finditer(rb'[\x20-\x7e]{4,80}', data):
        s = m.group()
        if b'#' in s and (b'hfw' in s or b'bch' in s or b'hBE' in s or b'=chq' in s or b'hQc' in s or b'fg=wq' in s or s.startswith(b'#') and b'.' in s):
            strings.add(s.decode('latin1'))
    for s in sorted(strings):
        print(s)
