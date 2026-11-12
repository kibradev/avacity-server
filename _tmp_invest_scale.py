import re, zipfile, json
from pathlib import Path

base = Path("/opt/avacity/base")

# versions entries for config
v = json.load(open(base/"files/versions.json", encoding="utf-8"))
for k in sorted(v):
    if "config_all" in k:
        print(k, "=>", v[k])

# Diff q1 awards between scaled and stock
def extract_q(raw, qid):
    m = re.search(rf'<quest\b[^>]*\bid="{qid}"[^>]*>.*?</quest>', raw, re.S)
    return m.group(0) if m else None

stock_zip = base/"files/data/config_all_tr_a617520e499a947bbf3d2bd48fcd3030.zip"
scaled = (base/"config_all_ru/modules/quests.xml").read_text(encoding="utf-8")
with zipfile.ZipFile(stock_zip) as z:
    stock = z.read("modules/quests.xml").decode("utf-8")

print("\n=== q1-q5 award diff stock TR vs scaled RU unpack ===")
for qid in ["q1","q2","q3","q4","q5"]:
    a = extract_q(stock, qid)
    b = extract_q(scaled, qid)
    # compare award blocks
    def awards(x):
        m = re.search(r"<award>(.*?)</award>", x, re.S)
        return re.sub(r"\s+", " ", m.group(1)).strip() if m else ""
    print(f"{qid} stock: {awards(a)}")
    print(f"{qid} scaled:{awards(b)}")
    print(f"{qid} titles same:", re.findall(r'title=\"#([^\"]+)\"', a)==re.findall(r'title=\"#([^\"]+)\"', b))

# createEvent / finishTutorial locale keys
ru = (base/"config_all_ru/translation/quest_ru.xml").read_text(encoding="utf-8")
for k in ["createEvent","createEventComment","finishTutorial","hbEventsTitle","quest5Comment"]:
    m = re.search(rf'<message\s+key="{k}"[^>]*>(.*?)</message>', ru, re.S)
    print(f"RU {k}: {m.group(1).strip()[:140] if m else 'MISSING'}")

with zipfile.ZipFile(stock_zip) as z:
    tr = z.read("translation/quest_tr.xml").decode("utf-8")
for k in ["createEvent","quest5Comment","buyCafeCheeseCake","danceInClub"]:
    m = re.search(rf'<message\s+key="{k}"[^>]*>(.*?)</message>', tr, re.S)
    print(f"TR {k}: {m.group(1).strip()[:140] if m else 'MISSING'}")

# locale name attribute in quest_tr
m = re.search(r'<locale name="[^"]+">', tr)
print("TR locale tag:", m.group(0) if m else None)
with zipfile.ZipFile(base/"files/data/config_all_tr_relabeled_85dbc7d5aef33769a828d715590d869a.zip") as z:
    tr2 = z.read("translation/quest_tr.xml").decode("utf-8")
m = re.search(r'<locale name="[^"]+">', tr2)
print("TR relabeled locale tag:", m.group(0) if m else None)

# Count missing task title keys across ALL quests vs quest_ru
parts = re.split(r"(?=<quest\b)", scaled)
missing_global = []
ru_keys = set(re.findall(r'key="([^"]+)"', ru))
for p in parts:
    m = re.match(r"<quest\b([^>]*)>", p)
    if not m: continue
    mid = re.search(r'\bid="([^"]+)"', m.group(1))
    if not mid: continue
    qid = mid.group(1)
    end = p.find("</quest>")
    body = p[:end+8] if end>=0 else p
    for k in re.findall(r'\btitle="#([^"]+)"', body) + re.findall(r"<title>#([^<]+)</title>", body) + re.findall(r"<description>#([^<]+)</description>", body):
        if k not in ru_keys:
            missing_global.append((qid,k))
print(f"\nGlobal missing title/desc keys vs quest_ru: {len(missing_global)} refs, {len(set(k for _,k in missing_global))} unique")
uniq = []
for qid,k in missing_global:
    if k not in uniq:
        uniq.append(k)
print("First 40 unique missing:", uniq[:40])
# specifically tutorial chain q1-q5 already known
