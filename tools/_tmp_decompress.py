#!/usr/bin/env python3
import re, zlib, struct, sys
raw = open("/opt/avacity/base/files/pnz-city.swf", "rb").read()
sig = raw[:3]
print("sig", sig, "len", len(raw))
body_hdr = raw[:8]
if sig == b"CWS":
    data = b"FWS" + raw[3:8] + zlib.decompress(raw[8:])
elif sig == b"ZWS":
    # lzma
    import lzma
    # SWF lzma: after 8-byte header, 4 bytes compressed len, then lzma props+data
    comp = raw[12:]
    props = raw[8:13]  # 5 bytes lzma props actually at [12:17]? handle generically
    try:
        data = raw  # fallback
        # proper: bytes 8-12 = compressed size, 12-17 = lzma props
        d = lzma.LZMADecompressor(format=lzma.FORMAT_ALONE)
        data = raw[:8] + d.decompress(raw[17:])
    except Exception as e:
        print("lzma err", e); data = raw
else:
    data = raw
print("decompressed len", len(data))

strings = []
for m in re.finditer(rb'[\x20-\x7e]{2,48}', data):
    strings.append(m.group().decode('latin1'))

for anchor in ["#$=chq", "#bchYr", "#hfwRG2", "#hBEILp"]:
    hits = [i for i,s in enumerate(strings) if anchor in s]
    print("ANCHOR", anchor, "hits", len(hits))
