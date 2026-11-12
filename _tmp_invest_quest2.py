import re, zipfile
from pathlib import Path
from collections import OrderedDict

base = Path("/opt/avacity/base")
q = (base / "config_all_ru/modules/quests.xml").read_text(encoding="utf-8", errors="replace")
ru = (base / "config_all_ru/translation/quest_ru.xml").read_text(encoding="utf-8", errors="replace")
ru_keys = set(re.findall(r'key="([^"]+)"', ru))

# Split into quest blocks carefully: find <quest ...> then match until matching </quest>
# Use regex non-greedy with nested awareness - quests don't nest deeply usually
parts = re.split(r"(?=<quest\b)", q)
quest_map = OrderedDict()
for p in parts:
    m = re.match(r"<quest\b([^>]*)>", p)
    if not m:
        continue
    mid = re.search(r'\bid="([^"]+)"', m.group(1))
    if not mid:
        continue
    qid = mid.group(1)
    # only content until first </quest> at quest level - take until </quest>
    end = p.find("</quest>")
    body = p[: end + 8] if end >= 0 else p
    # element form: <title>#key</title>, <description>#key</description>, <comment>#key</comment>
    elem_keys = []
    for tag in ("title", "description", "comment"):
        elem_keys += re.findall(rf"<{tag}>#([^<]+)</{tag}>", body)
    # attribute form title="#key" description="#key"
    attr_keys = re.findall(r'\b(?:title|description)="#([^"]+)"', body)
    keys = []
    for k in elem_keys + attr_keys:
        if k not in keys:
            keys.append(k)
    titles_attr = re.findall(r'\btitle="#([^"]+)"', body)
    titles_elem = re.findall(r"<title>#([^<]+)</title>", body)
    descs = re.findall(r"<description>#([^<]+)</description>", body) + re.findall(r'\bdescription="#([^"]+)"', body)
    quest_map[qid] = {
        "keys": keys,
        "title_attrs": titles_attr,
        "title_elems": titles_elem,
        "descs": list(dict.fromkeys(descs)),
    }

order = list(quest_map.keys())
print("Total quests:", len(order))
print("First 20:", order[:20])

def report(qids, label):
    print("\n===", label, "===")
    for qid in qids:
        info = quest_map.get(qid)
        if not info:
            print(qid, "NOT FOUND")
            continue
        missing = [k for k in info["keys"] if k not in ru_keys]
        print(f"\n{qid}: keys={info['keys']}")
        print(f"  title=# attrs: {info['title_attrs']}")
        print(f"  <title> elems: {info['title_elems']}")
        print(f"  descs: {info['descs']}")
        print(f"  MISSING from quest_ru ({len(missing)}): {missing}")

report(["q1","q2","q3","q4","q5"], "q1-q5 full keys")
report(order[:20], "first 20 full keys")

print("\n=== MISSING title/desc (attrs+elems) first 10 quests ===")
miss = []
for qid in order[:10]:
    info = quest_map[qid]
    # only title and description refs as requested
    title_desc = []
    for k in info["title_attrs"] + info["title_elems"] + info["descs"]:
        if k not in title_desc:
            title_desc.append(k)
    for k in title_desc:
        if k not in ru_keys:
            miss.append((qid, k))
            print(f"  {qid}: {k}")
print("TOTAL:", len(miss))
print([k for _,k in miss])

# also dump which of q1-q5 title/comment exist
print("\n=== Presence of common q1-q5 keys in quest_ru ===")
for k in ["quest1Title","quest1Comment","quest1Task1Title","quest2Title","quest2Comment","quest2Task1Title",
          "quest3Title","quest3Comment","quest158Task2Title","quest4Title","quest4Comment","danceInClub",
          "quest5Title","quest5Comment","quest125Task1Title"]:
    print(f"  {k}: {'YES' if k in ru_keys else 'NO'}")
