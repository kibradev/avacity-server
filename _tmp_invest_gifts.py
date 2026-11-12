import re
from pathlib import Path
q = Path("/opt/avacity/base/config_all_ru/modules/quests.xml").read_text(encoding="utf-8")
# giftsButtonTitle refs
for m in re.finditer(r'.{0,80}giftsButtonTitle.{0,80}', q):
    print(m.group(0).replace("\n"," "))
# show quest that uses it
for m in re.finditer(r'<quest\b[^>]*\bid="([^"]+)"[^>]*>.*?giftsButtonTitle.*?</quest>', q, re.S):
    print("quest", m.group(1))
    break
