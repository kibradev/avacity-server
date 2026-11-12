#!/usr/bin/env python3
"""Scale exp/gold/silver in quests.xml and repack client config zip."""
import hashlib
import json
import os
import re
import shutil
import sys
import zipfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, ROOT)
import const

QUESTS = os.path.join(ROOT, "config_all_ru", "modules", "quests.xml")


def scale_quests_xml(mult):
    text = open(QUESTS, encoding="utf-8").read()
    counts = {}
    for tag in ("exp", "gold", "silver"):
        text, n = re.subn(
            rf"<{tag}>(\d+)</{tag}>",
            lambda m, t=tag: f"<{t}>{int(m.group(1)) * mult}</{t}>",
            text)
        counts[tag] = n
    with open(QUESTS, "w", encoding="utf-8") as f:
        f.write(text)
    return counts


def repack_config():
    os.chdir(ROOT)
    zpath = "files/data/config_all_ru.zip"
    with zipfile.ZipFile(zpath, mode="w",
                         compression=zipfile.ZIP_DEFLATED) as z:
        for root, _dirs, files in os.walk("config_all_ru"):
            for file in files:
                full = os.path.join(root, file)
                arc = full.split("config_all_ru/", 1)[1]
                z.write(full, arcname=arc)
    with open(zpath, "rb") as f:
        hash_ = hashlib.md5(f.read()).hexdigest()
    final = f"files/data/config_all_ru_{hash_}.zip"
    os.rename(zpath, final)
    versions_path = "files/versions.json"
    with open(versions_path, encoding="utf-8") as f:
        versions = json.load(f)
    versions["data/config_all_ru.zip"] = hash_
    with open(versions_path, "w", encoding="utf-8") as f:
        json.dump(versions, f)
    return final


def main():
    mult = getattr(const, "QUEST_REWARD_MULTIPLIER", 1)
    if mult <= 1:
        print("QUEST_REWARD_MULTIPLIER is", mult, "- nothing to do")
        return
    if not os.path.isfile(QUESTS):
        print("Missing", QUESTS)
        sys.exit(1)
    sample = open(QUESTS, encoding="utf-8").read()
    m = re.search(r'id="q2"[\s\S]*?<exp>(\d+)</exp>', sample)
    if m and int(m.group(1)) >= 100:
        print("quests.xml already scaled (q2 exp=%s), skipping XML edit"
              % m.group(1))
    else:
        counts = scale_quests_xml(mult)
        print("Updated quests.xml:", counts)
    print("Repacked:", repack_config())
    # Keep TR config in sync with scaled RU quests + locale patches.
    sync = os.path.join(ROOT, "tools", "sync_tr_quest_config.py")
    if os.path.isfile(sync):
        print("Syncing TR quest config...")
        import subprocess
        subprocess.check_call([sys.executable, sync], cwd=ROOT)
    else:
        print("Reminder: run python3 tools/sync_tr_quest_config.py to sync TR.")
    print("Restart server and hard-refresh the game client.")


if __name__ == "__main__":
    main()
