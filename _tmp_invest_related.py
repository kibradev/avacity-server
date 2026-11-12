import re, zipfile
from pathlib import Path

base = Path("/opt/avacity/base")

# Check related keys in quest_ru and quest_tr (from zip)
ru = (base/"config_all_ru/translation/quest_ru.xml").read_text(encoding="utf-8", errors="replace")
ru_keys = set(re.findall(r'key="([^"]+)"', ru))

patterns = [
    r"quest1Task", r"quest2Task", r"quest158", r"quest125",
    r"wearClothes", r"roomDecor", r"finishTutorial", r"buyRandomItem",
]
print("=== Related keys in quest_ru ===")
for pat in patterns:
    matched = sorted(k for k in ru_keys if re.search(pat, k, re.I))
    print(f"{pat}: {matched[:40]}{'...' if len(matched)>40 else ''} (n={len(matched)})")

# dump messages for nearby keys
for k in ["quest1Title","quest1Comment","quest2Title","quest2Comment","quest3Title",
          "quest158Title","quest158Task1Title","quest158Task2Title","quest125Title","quest125Task1Title",
          "danceInClub","quest5Title"]:
    m = re.search(rf'<message\s+key="{k}"[^>]*>(.*?)</message>', ru, re.S)
    print(f"RU {k}: {m.group(1).strip()[:100] if m else 'MISSING'}")

# quest_tr from zip
tr_zip = base/"files/data/config_all_tr_relabeled_85dbc7d5aef33769a828d715590d869a.zip"
with zipfile.ZipFile(tr_zip) as z:
    tr = z.read("translation/quest_tr.xml").decode("utf-8", errors="replace")
tr_keys = set(re.findall(r'key="([^"]+)"', tr))
print("\n=== Missing keys in quest_tr? ===")
for k in ["quest1Task1Title","quest2Task1Title","quest158Task2Title","quest125Task1Title",
          "quest1Title","quest2Title","quest3Title","quest4Title","quest5Title"]:
    m = re.search(rf'<message\s+key="{k}"[^>]*>(.*?)</message>', tr, re.S)
    print(f"TR {k}: {m.group(1).strip()[:120] if m else 'MISSING'}")

print("\n=== quest_tr sample around quest2 ===")
# find quest2Title and print surrounding messages
idx = tr.find('key="quest2Title"')
if idx < 0:
    print("quest2Title not found")
else:
    # back up to previous few messages
    start = max(0, tr.rfind("<message", 0, idx) )
    # find a wider window: from quest1Comment area
    i1 = tr.find('key="quest1Title"')
    i2 = tr.find('key="quest3Title"')
    if i1 >= 0 and i2 >= 0:
        # include a bit before quest1Title
        a = tr.rfind("<message", 0, i1)
        print(tr[a:i2+200])
    else:
        print(tr[max(0,idx-500):idx+800])

print("\n=== Check ALL locale quest_*.xml in zips for message definitions of missing keys ===")
keys = ["quest1Task1Title","quest2Task1Title","quest158Task2Title","quest125Task1Title"]
for zp in sorted((base/"files/data").glob("config_all_*.zip")):
    with zipfile.ZipFile(zp) as z:
        for name in z.namelist():
            if not re.search(r"quest_..\.xml$", name):
                continue
            raw = z.read(name).decode("utf-8", errors="ignore")
            for k in keys:
                m = re.search(rf'<message\s+key="{k}"[^>]*>(.*?)</message>', raw, re.S)
                if m:
                    print(f"FOUND {k} in {zp.name}:{name} = {m.group(1).strip()[:150]}")

# also search tutorial_*.xml and detached
print("\n=== Search tutorial/detached/dictionary for missing keys or wearClothes text ===")
for zp_name in ["config_all_ru_95ffe5faa4f1d5a0c1bca77a07053c65.zip",
                "config_all_tr_relabeled_85dbc7d5aef33769a828d715590d869a.zip",
                "config_all_en_684cafb3ea2c92aecefd9b025c10d2f0.zip"]:
    zp = base/"files/data"/zp_name
    with zipfile.ZipFile(zp) as z:
        for name in z.namelist():
            if not name.endswith(".xml"):
                continue
            if "quest" not in name and "tutorial" not in name and "detached" not in name and "dictionary" not in name:
                continue
            raw = z.read(name).decode("utf-8", errors="ignore")
            for k in keys + ["wearClothes", "WearClothes"]:
                if k in raw and f'key="{k}"' in raw or (k.startswith("quest") and f'key="{k}"' in raw):
                    m = re.search(rf'<message\s+key="{re.escape(k)}"[^>]*>(.*?)</message>', raw, re.S)
                    if m:
                        print(f"{zp_name}:{name} key={k} => {m.group(1).strip()[:120]}")
