import zipfile, re, json
from pathlib import Path

# versions
v=json.load(open('files/versions.json'))
print('versions ru', v.get('data/config_all_ru.zip'))
print('versions tr', v.get('data/config_all_tr.zip'))

# RU source q2
text=open('config_all_ru/modules/quests.xml',encoding='utf-8').read()
m=re.search(r'id="q2"[\s\S]*?</quest>', text)
chunk=m.group(0)
for tag in ('exp','gold','silver'):
    mm=re.search(rf'<{tag}>(\d+)</{tag}>', chunk)
    print('ru_src', tag, mm.group(1) if mm else None)
print('q2 task title', re.search(r'title="#([^"]+)"', chunk).group(1))

# locale keys in RU
ru=open('config_all_ru/translation/quest_ru.xml',encoding='utf-8').read()
for k in ['quest1Task1Title','quest2Task1Title','quest158Task2Title','quest125Task1Title','buyCafeCheeseCake']:
    print('ru_key', k, 'YES' if f'key="{k}"' in ru else 'NO')

# TR relabeled zip
import glob
rel=sorted(glob.glob('files/data/config_all_tr_relabeled_*.zip'))[-1]
print('relabeled', rel)
with zipfile.ZipFile(rel) as z:
    q=z.read('modules/quests.xml').decode('utf-8')
    m=re.search(r'id="q2"[\s\S]*?</quest>', q)
    chunk=m.group(0)
    for tag in ('exp','gold','silver'):
        mm=re.search(rf'<{tag}>(\d+)</{tag}>', chunk)
        print('tr_rel', tag, mm.group(1) if mm else None)
    qt=z.read('translation/quest_tr.xml').decode('utf-8')
    print('locale_tag', re.search(r'<locale name="([^"]+)">', qt).group(1))
    for k in ['quest1Task1Title','quest2Task1Title','quest158Task2Title','quest125Task1Title']:
        i=qt.find(f'key="{k}"')
        if i<0:
            print('tr_key', k, 'NO')
        else:
            print('tr_key', k, qt[i:i+120].replace('\n',' ')[:120])
