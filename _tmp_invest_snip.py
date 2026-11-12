from pathlib import Path
import re
p = Path("/opt/avacity/base/config_all_ru/modules/quests.xml")
text = p.read_text(encoding="utf-8", errors="replace")
# show snippets for q1-q5
for qid in ["q1","q2","q3","q4","q5"]:
    m = re.search(rf'<quest\b[^>]*\bid="{qid}"[^>]*>', text)
    print("===", qid, "===")
    if not m:
        print("NOT FOUND")
        continue
    start = m.start()
    # print next 1500 chars
    print(text[start:start+1800])
    print("---END---\n")
