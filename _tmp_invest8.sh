#!/bin/bash
cd /opt/avacity/base
# confirm server-side quest parse source
./venv/bin/python - <<'PY'
import inspect, modules.quest as q
# find where quest dict loaded
import common, os
print('looking for quests load...')
PY
grep -rn "quests.xml\|modules/quests\|parse.*quest\|load_quest" --include='*.py' . 2>/dev/null | grep -v venv | grep -v __pycache__ | head -25
rm -f _tmp_invest.sh _tmp_invest2.sh _tmp_invest3.sh _tmp_invest4.sh _tmp_invest5.sh _tmp_invest6.sh _tmp_invest7.sh _tmp_q2.py _tmp_quest_invest.sh
echo cleaned