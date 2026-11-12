#!/usr/bin/env python3
import re, glob
files = glob.glob("/opt/avacity/base/files/swf/Ui*.swf") + \
        glob.glob("/opt/avacity/base/files/swf/House*.swf") + \
        glob.glob("/opt/avacity/base/files/swf/UiInit*.swf")
needle = b"bchYr"
for path in files:
    data = open(path, "rb").read()
    if needle in data or b"#hfwRG2" in data or b"$=chq" in data:
        print("HIT", path)
        # extract nearby strings
        for m in re.finditer(rb'[\x20-\x7e]{3,60}', data):
            s = m.group()
            if b'bchYr' in s or b'$=chq' in s or b'hfwRG2' in s or (b'#' in s and (b'hBE' in s or b'=chq' in s)):
                print(" ", s.decode("latin1"))
    else:
        print("miss", path.split("/")[-1])
