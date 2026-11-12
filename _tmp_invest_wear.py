import re, zipfile
from pathlib import Path

base = Path("/opt/avacity/base")
q = (base/"config_all_ru/modules/quests.xml").read_text(encoding="utf-8", errors="replace")

print("=== All wearClothes tasks ===")
for m in re.finditer(r'<task\b[^>]*type="wearClothes"[^/]*/?>', q):
    print(m.group(0)[:300])

print("\n=== wearClothes with nested body ===")
for m in re.finditer(r'<task\b[^>]*type="wearClothes"[^>]*>.*?</task>', q, re.S):
    print(m.group(0)[:400])
    print("---")

# Compare older RU zip quests for q1-q5 titles if different
print("\n=== Compare q1-q5 task titles across RU zip ages ===")
for zp in sorted((base/"files/data").glob("config_all_ru_*.zip")):
    with zipfile.ZipFile(zp) as z:
        raw = z.read("modules/quests.xml").decode("utf-8", errors="replace")
    titles = []
    for qid in ["q1","q2","q3","q4","q5"]:
        mm = re.search(rf'<quest\b[^>]*\bid="{qid}"[^>]*>.*?</quest>', raw, re.S)
        if not mm:
            titles.append(f"{qid}=?")
            continue
        body = mm.group(0)
        tattrs = re.findall(r'\btitle="#([^"]+)"', body)
        titles.append(f"{qid}:{tattrs}")
    print(zp.name, titles)

# Check if quest158 / quest125 task titles exist under different naming in EN zip quest file vs locale
print("\n=== Messages mentioning fountain/wear/cheesecake/tutorial near early quests in EN/RU ===")
# look at similar task title patterns that DO exist for roomDecor etc
ru = (base/"config_all_ru/translation/quest_ru.xml").read_text(encoding="utf-8", errors="replace")
# search CDATA or text containing фонтан / переод / чизкейк etc related to tasks
for needle in ["фонтан", "Фонтан", "Переодень", "переодень", "чизкейк", "Чизкейк", "туториал", "обучен", "надень", "Надень"]:
    for i, line in enumerate(ru.splitlines()):
        if needle.lower() in line.lower():
            # get key from nearby
            prev = "\n".join(ru.splitlines()[max(0,i-2):i+1])
            km = re.search(r'key="([^"]+)"', prev)
            print(f"  needle={needle} key={km.group(1) if km else '?'} :: {line.strip()[:160]}")

# versions.json
import json
v = json.load(open(base/"files/versions.json", encoding="utf-8"))
print("\n=== versions.json type/len ===", type(v), len(v) if hasattr(v,"__len__") else "")
if isinstance(v, dict):
    for k,val in v.items():
        s = str(val) + str(k)
        if "config_all_tr" in s or (isinstance(k,str) and "tr" in k and "config" in k):
            print(k, "=>", val)
    # also print structure sample
    print("sample keys:", list(v.keys())[:20])
    # find config_all entries
    for k,val in list(v.items())[:5]:
        print(" sample", k, val)
elif isinstance(v, list):
    for item in v:
        if "tr" in str(item).lower() and "config" in str(item).lower():
            print(item)
