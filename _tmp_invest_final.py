import re
from pathlib import Path
q = Path("/opt/avacity/base/config_all_ru/modules/quests.xml").read_text(encoding="utf-8")
ru = Path("/opt/avacity/base/config_all_ru/translation/quest_ru.xml").read_text(encoding="utf-8")
ru_keys = set(re.findall(r'key="([^"]+)"', ru))
parts = re.split(r"(?=<quest\b)", q)
order=[]
quest_map={}
for p in parts:
    m=re.match(r"<quest\b([^>]*)>", p)
    if not m: continue
    mid=re.search(r'\bid="([^"]+)"', m.group(1))
    if not mid: continue
    qid=mid.group(1)
    end=p.find("</quest>")
    body=p[:end+8] if end>=0 else p
    title_desc=[]
    for k in re.findall(r'\btitle="#([^"]+)"', body)+re.findall(r'\bdescription="#([^"]+)"', body)+re.findall(r"<title>#([^<]+)</title>", body)+re.findall(r"<description>#([^<]+)</description>", body):
        if k not in title_desc: title_desc.append(k)
    quest_map[qid]=title_desc
    order.append(qid)
print("First 10 quests ALL title/desc refs and missing:")
for qid in order[:10]:
    miss=[k for k in quest_map[qid] if k not in ru_keys]
    print(qid, "refs=", quest_map[qid])
    print("  MISSING:", miss)
