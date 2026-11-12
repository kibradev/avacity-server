#!/usr/bin/env python3
import re
data = open("/opt/avacity/base/files/pnz-city.swf", "rb").read()
# All hash-prefixed short tokens
toks = set()
for m in re.finditer(rb'#[\x21-\x7e]{2,14}', data):
    s = m.group().decode('latin1')
    # room-ish tokens: contain letters/symbols, exclude ones with many dots
    toks.add(s)

# Print tokens that look like the room family (near bchYr / $=chq style)
interesting = sorted(t for t in toks if any(c in t for c in "=$") or t in ("#bchYr",) or re.match(r'#[a-zA-Z0-9=$]{4,8}$', t))
print("TOTAL tokens", len(toks), "interesting", len(interesting))
for t in interesting:
    print(t)
