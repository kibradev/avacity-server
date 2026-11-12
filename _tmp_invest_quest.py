import re
from pathlib import Path

base = Path("/opt/avacity/base")
q = (base / "config_all_ru/modules/quests.xml").read_text(encoding="utf-8", errors="replace")
ru = (base / "config_all_ru/translation/quest_ru.xml").read_text(encoding="utf-8", errors="replace")
ru_keys = set(re.findall(r'key="([^"]+)"', ru))

parts = re.split(r"(?=<quest\b)", q)
quest_map = {}
order = []
for p in parts:
    m = re.match(r"<quest\b([^>]*)>", p)
    if not m:
        continue
    attrs = m.group(1)
    mid = re.search(r'\bid="([^"]+)"', attrs)
    if not mid:
        continue
    qid = mid.group(1)
    titles = re.findall(r'\btitle="#([^"]+)"', p)
    descs = re.findall(r'\bdescription="#([^"]+)"', p)
    quest_map[qid] = {"titles": titles, "descs": descs}
    order.append(qid)

print("Total quests:", len(order))
print("First 20 ids:", order[:20])

def report(qids, label):
    print("\n===", label, "===")
    for qid in qids:
        info = quest_map.get(qid)
        if not info:
            print(qid + ": NOT FOUND")
            continue
        keys = []
        for k in info["titles"] + info["descs"]:
            if k not in keys:
                keys.append(k)
        missing = [k for k in keys if k not in ru_keys]
        print("\n" + qid + ":", len(keys), "keys,", len(missing), "missing")
        print("  titles:", info["titles"])
        print("  descs:", info["descs"])
        if missing:
            print("  MISSING:", missing)
        else:
            print("  all present in quest_ru")

report(["q1", "q2", "q3", "q4", "q5"], "q1-q5")
report(order[:20], "first 20 quests")

print("\n=== ALL missing title/desc keys in first 10 quests vs quest_ru ===")
missing_all = []
for qid in order[:10]:
    info = quest_map[qid]
    for k in info["titles"] + info["descs"]:
        if k not in ru_keys and (qid, k) not in missing_all:
            missing_all.append((qid, k))
            print(" ", qid + ":", k)
print("TOTAL MISSING:", len(missing_all))
for qid, k in missing_all:
    print(k)
