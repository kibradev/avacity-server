import zipfile
from pathlib import Path

zips = [
    Path("/opt/avacity/base/files/data/config_all_tr_a617520e499a947bbf3d2bd48fcd3030.zip"),
    Path("/opt/avacity/base/files/data/config_all_tr_relabeled_85dbc7d5aef33769a828d715590d869a.zip"),
]
for zp in zips:
    print("====", zp.name, "====")
    with zipfile.ZipFile(zp) as z:
        names = z.namelist()
        # top-level
        tops = sorted({n.split("/")[0] for n in names})
        print("top-level entries:", tops)
        print("total files:", len(names))
        print("\nfirst 40:")
        for n in names[:40]:
            print(" ", n)
        print("\ntranslation/ files:")
        for n in names:
            if n.startswith("translation/") or "/translation/" in n:
                print(" ", n)
        print("\nquest-related:")
        for n in names:
            if "quest" in n.lower():
                print(" ", n)
        print("\nversions:")
        for n in names:
            if "version" in n.lower():
                print(" ", n)
    print()
