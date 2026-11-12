import re, zipfile
from pathlib import Path

base = Path("/opt/avacity/base")
q = (base/"config_all_ru/modules/quests.xml").read_text(encoding="utf-8", errors="replace")
ru = (base/"config_all_ru/translation/quest_ru.xml").read_text(encoding="utf-8", errors="replace")

# Extract q125 and q158 full blocks for alternate titles
for qid in ["q125", "q158"]:
    m = re.search(rf'<quest\b[^>]*\bid="{qid}"[^>]*>.*?</quest>', q, re.S)
    print(f"=== {qid} ===")
    print(m.group(0)[:1200] if m else "NOT FOUND")
    print()

# Useful alternate keys that exist
alts = [
    "buyCafeCheeseCake", "buyCafePie", "quest6Task1Title",
    "quest125Title", "quest125Description", "quest158Title", "quest158Description",
    "quest1Title", "quest2Title", "quest3Title", "quest5Title",
]
print("=== Alternate key texts RU ===")
for k in alts:
    m = re.search(rf'<message\s+key="{k}"[^>]*>(.*?)</message>', ru, re.S)
    print(f"  {k}: {m.group(1).strip()[:160] if m else 'MISSING'}")

tr_zip = base/"files/data/config_all_tr_a617520e499a947bbf3d2bd48fcd3030.zip"
with zipfile.ZipFile(tr_zip) as z:
    tr = z.read("translation/quest_tr.xml").decode("utf-8")
print("\n=== Same alts TR ===")
for k in alts:
    m = re.search(rf'<message\s+key="{k}"[^>]*>(.*?)</message>', tr, re.S)
    print(f"  {k}: {m.group(1).strip()[:160] if m else 'MISSING'}")

# Format of several message styles in quest_tr near quest2
print("\n=== Format diversity in quest_tr (first 15 messages with Task in key) ===")
n = 0
for m in re.finditer(r'<message\s+key="([^"]*Task[^"]*)"[^>]*>(.*?)</message>', tr, re.S):
    print(f'  <message key="{m.group(1)}">{m.group(2).strip()[:140]}</message>')
    n += 1
    if n >= 12:
        break

# Check tools mentioning quest sync / scaled
print("\n=== Grep tools for quest/repack/relabel/scaled ===")
for p in Path(base/"tools").glob("*.py"):
    t = p.read_text(encoding="utf-8", errors="ignore")
    if any(x in t.lower() for x in ["quest", "relabel", "repack", "config_all_tr", "scaled"]):
        print(p.name, "hits")
for p in Path(base/"utils").glob("*.py"):
    t = p.read_text(encoding="utf-8", errors="ignore")
    if any(x in t.lower() for x in ["quest", "relabel", "repack", "config_all_tr", "scaled"]):
        print("utils/"+p.name)

# check web.py LANG_SWAP
web = (base/"web.py").read_text(encoding="utf-8", errors="ignore")
for i, line in enumerate(web.splitlines()):
    if "LANG_SWAP" in line or "relabeled" in line or "config_all_tr" in line:
        print(f"web.py:{i+1}: {line.strip()[:160]}")
