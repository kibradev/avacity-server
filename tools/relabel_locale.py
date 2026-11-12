#!/usr/bin/env python3
"""Build a config_all_<lang> variant whose translation/*.xml files are
relabeled as <locale name="ru"> so the client (whose internal Config.locale
stays "ru" - our appconfig.xml <locale> tag doesn't actually change it) can
still look the strings up. Without this the client silently falls back to
showing raw dictionary keys (e.g. "publicPlacesTitle") for any swapped
non-ru language, since it only ever searches the "ru" locale block.

Output is named config_all_<lang>_relabeled_<md5>.zip so web.py's
_LANG_SWAP_ASSETS glob can target it specifically (the "relabeled" marker
sits before the hash, unlike a suffix, so the existing
"basename.rsplit('_', 1)[-1]" hash-extraction logic in web.py keeps working
unchanged).
"""
import glob
import hashlib
import os
import re
import sys
import zipfile

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def relabel(lang):
    pattern = os.path.join(BASE, "files", "data", f"config_all_{lang}_*.zip")
    matches = sorted(
        p for p in glob.glob(pattern) if "_relabeled_" not in p
    )
    if not matches:
        print(f"no config_all_{lang}_*.zip found")
        return
    src = matches[0]

    buf = bytearray()
    with zipfile.ZipFile(src) as zin:
        import io
        out_stream = io.BytesIO()
        with zipfile.ZipFile(out_stream, "w", zipfile.ZIP_DEFLATED) as zout:
            for item in zin.infolist():
                data = zin.read(item.filename)
                if item.filename.startswith("translation/") and \
                   item.filename.endswith(".xml"):
                    text = data.decode("utf-8")
                    text = re.sub(
                        r'<locale name="[a-z]+">', '<locale name="ru">', text
                    )
                    data = text.encode("utf-8")
                zout.writestr(item, data)
        buf = out_stream.getvalue()

    md5 = hashlib.md5(buf).hexdigest()
    dst = os.path.join(
        BASE, "files", "data", f"config_all_{lang}_relabeled_{md5}.zip"
    )
    with open(dst, "wb") as f:
        f.write(buf)
    print(f"{src} -> {dst}")


if __name__ == "__main__":
    langs = sys.argv[1:] or ["tr"]
    for lang in langs:
        relabel(lang)
