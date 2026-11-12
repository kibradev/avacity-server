#!/usr/bin/env python3
"""Sync scaled RU quests.xml into TR config zip and ensure missing locale keys.

Copies config_all_ru/modules/quests.xml into the TR config zip, ensures the
four tutorial/task locale keys exist in RU source and TR translation, repacks
TR, updates versions.json, and runs relabel_locale.py.
"""
from __future__ import annotations

import glob
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import zipfile

from scale_achievement_thresholds import scale_locale_threshold_text

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

RU_QUESTS = os.path.join(ROOT, "config_all_ru", "modules", "quests.xml")
RU_LOCALE = os.path.join(ROOT, "config_all_ru", "translation", "quest_ru.xml")
VERSIONS = os.path.join(ROOT, "files", "versions.json")
DATA_DIR = os.path.join(ROOT, "files", "data")

RU_KEYS = {
    "quest1Task1Title": (
        '<message key="quest1Task1Title">'
        '<![CDATA[<span class="bold">\u0423\u0441\u0442\u0430\u043d\u043e\u0432\u0438\u0442\u044c \u0444\u043e\u043d\u0442\u0430\u043d \u0432 \u043a\u0432\u0430\u0440\u0442\u0438\u0440\u0435</span>]]>'
        "</message>"
    ),
    "quest2Task1Title": (
        '<message key="quest2Task1Title">'
        '<![CDATA[<span class="bold">\u041d\u0430\u0434\u0435\u0442\u044c \u043a\u0443\u043f\u043b\u0435\u043d\u043d\u0443\u044e \u043e\u0434\u0435\u0436\u0434\u0443</span>]]>'
        "</message>"
    ),
    "quest158Task2Title": (
        '<message key="quest158Task2Title">'
        '<![CDATA[<span class="bold">\u0417\u0430\u043a\u0430\u0437\u0430\u0442\u044c \u0447\u0438\u0437\u043a\u0435\u0439\u043a \u0432 \u043a\u0430\u0444\u0435</span>]]>'
        "</message>"
    ),
    "quest125Task1Title": (
        '<message key="quest125Task1Title">'
        '<![CDATA[<span class="bold">\u0417\u0430\u0432\u0435\u0440\u0448\u0438\u0442\u044c \u043e\u0431\u0443\u0447\u0435\u043d\u0438\u0435</span>]]>'
        "</message>"
    ),
}

TR_KEYS = {
    "quest1Task1Title": (
        '<message key="quest1Task1Title">'
        '<![CDATA[<span class="bold">Daireye s\u00fcs havuzu yerle\u015ftirin</span>]]>'
        "</message>"
    ),
    "quest2Task1Title": (
        '<message key="quest2Task1Title">'
        '<![CDATA[<span class="bold">Sat\u0131n ald\u0131\u011f\u0131n\u0131z k\u0131yafetleri giyin</span>]]>'
        "</message>"
    ),
    "quest158Task2Title": (
        '<message key="quest158Task2Title">'
        '<![CDATA[<span class="bold">Kafede bir cheesecake \u0131smarlay\u0131n</span>]]>'
        "</message>"
    ),
    "quest125Task1Title": (
        '<message key="quest125Task1Title">'
        '<![CDATA[<span class="bold">E\u011fitimi tamamlay\u0131n</span>]]>'
        "</message>"
    ),
}


def _indent_of_message(text):
    m = re.search(r"(?m)^([ \t]*)<message key=", text)
    return m.group(1) if m else "        "


def ensure_locale_keys(path, keys):
    """Insert missing <message> keys into a quest_*.xml locale file."""
    text = open(path, encoding="utf-8").read()
    indent = _indent_of_message(text)
    missing = []
    for key, line in keys.items():
        if re.search(r'key="%s"' % re.escape(key), text):
            continue
        missing.append("%s%s" % (indent, line))
    if not missing:
        return []
    block = "\n".join(missing) + "\n"
    anchor = re.search(
        r'(?m)^[ \t]*<message key="quest2Comment">.*?</message>\s*\n',
        text,
    )
    if not anchor:
        anchor = re.search(
            r'(?m)^[ \t]*<message key="quest2Title">.*?</message>\s*\n',
            text,
        )
    if anchor:
        text = text[: anchor.end()] + block + text[anchor.end():]
    else:
        text, n = re.subn(
            r"(?m)^([ \t]*)</locale>",
            block + r"\1</locale>",
            text,
            count=1,
        )
        if n != 1:
            raise RuntimeError("could not insert keys into %s" % path)
    with open(path, "w", encoding="utf-8", newline="\n") as f:
        f.write(text)
    return [re.search(r'key="([^"]+)"', m).group(1) for m in missing]


def optional_retarget_q3(quests_path):
    """If buyCafeCheeseCake exists in RU locale, retarget quest158Task2Title refs."""
    ru = open(RU_LOCALE, encoding="utf-8").read()
    if 'key="buyCafeCheeseCake"' not in ru:
        return False
    q = open(quests_path, encoding="utf-8").read()
    if "#quest158Task2Title" not in q:
        return False
    q2 = q.replace("#quest158Task2Title", "#buyCafeCheeseCake")
    with open(quests_path, "w", encoding="utf-8", newline="\n") as f:
        f.write(q2)
    return True


def find_tr_src():
    pattern = os.path.join(DATA_DIR, "config_all_tr_*.zip")
    matches = sorted(p for p in glob.glob(pattern) if "_relabeled_" not in p)
    if not matches:
        raise FileNotFoundError("no non-relabeled config_all_tr_*.zip")
    return matches[0]


def pack_dir(src_dir, out_prefix, versions_key):
    os.makedirs(DATA_DIR, exist_ok=True)
    tmp = os.path.join(DATA_DIR, "%s.zip" % out_prefix)
    with zipfile.ZipFile(tmp, mode="w", compression=zipfile.ZIP_DEFLATED) as z:
        for root, _dirs, files in os.walk(src_dir):
            for file in files:
                full = os.path.join(root, file)
                arc = os.path.relpath(full, src_dir).replace("\\", "/")
                z.write(full, arcname=arc)
    with open(tmp, "rb") as f:
        hash_ = hashlib.md5(f.read()).hexdigest()
    final = os.path.join(DATA_DIR, "%s_%s.zip" % (out_prefix, hash_))
    if os.path.exists(final):
        os.remove(final)
    os.rename(tmp, final)
    with open(VERSIONS, encoding="utf-8") as f:
        versions = json.load(f)
    versions[versions_key] = hash_
    with open(VERSIONS, "w", encoding="utf-8") as f:
        json.dump(versions, f)
    return final


def extract_zip(zpath, dest):
    if os.path.isdir(dest):
        shutil.rmtree(dest)
    os.makedirs(dest, exist_ok=True)
    with zipfile.ZipFile(zpath) as z:
        z.extractall(dest)


def sync_tr(tmpdir=None):
    tmp = tmpdir or "/tmp/config_all_tr"
    tr_src = find_tr_src()
    extract_zip(tr_src, tmp)

    dest_quests = os.path.join(tmp, "modules", "quests.xml")
    shutil.copy2(RU_QUESTS, dest_quests)
    shutil.copy2(
        os.path.join(ROOT, "config_all_ru", "modules", "achievements.xml"),
        os.path.join(tmp, "modules", "achievements.xml"),
    )

    tr_locale = os.path.join(tmp, "translation", "quest_tr.xml")
    tr_achievement_locale = os.path.join(
        tmp, "translation", "achievements_tr.xml")
    scale_locale_threshold_text(tr_achievement_locale)
    tr_added = ensure_locale_keys(tr_locale, TR_KEYS)
    ru_added = ensure_locale_keys(RU_LOCALE, RU_KEYS)

    retargeted = optional_retarget_q3(RU_QUESTS)
    if retargeted:
        shutil.copy2(RU_QUESTS, dest_quests)

    old_tr = list(glob.glob(os.path.join(DATA_DIR, "config_all_tr_*.zip")))
    final = pack_dir(tmp, "config_all_tr", "data/config_all_tr.zip")

    for p in old_tr:
        if os.path.abspath(p) != os.path.abspath(final):
            try:
                os.remove(p)
            except OSError:
                pass

    relabel = os.path.join(ROOT, "tools", "relabel_locale.py")
    subprocess.check_call([sys.executable, relabel, "tr"], cwd=ROOT)

    return {
        "tr_src": tr_src,
        "tr_zip": final,
        "tr_hash": os.path.basename(final).rsplit("_", 1)[-1].replace(".zip", ""),
        "ru_added": ru_added,
        "tr_added": tr_added,
        "retargeted": retargeted,
    }


def repack_ru():
    """Repack config_all_ru without re-multiplying awards."""
    tmp = os.path.join(DATA_DIR, "config_all_ru.zip")
    ru_dir = os.path.join(ROOT, "config_all_ru")
    with zipfile.ZipFile(tmp, mode="w", compression=zipfile.ZIP_DEFLATED) as z:
        for root, _dirs, files in os.walk(ru_dir):
            for file in files:
                full = os.path.join(root, file)
                arc = os.path.relpath(full, ru_dir).replace("\\", "/")
                z.write(full, arcname=arc)
    with open(tmp, "rb") as f:
        hash_ = hashlib.md5(f.read()).hexdigest()
    final = os.path.join(DATA_DIR, "config_all_ru_%s.zip" % hash_)
    if os.path.exists(final):
        os.remove(final)
    os.rename(tmp, final)
    with open(VERSIONS, encoding="utf-8") as f:
        versions = json.load(f)
    versions["data/config_all_ru.zip"] = hash_
    with open(VERSIONS, "w", encoding="utf-8") as f:
        json.dump(versions, f)
    return final


def verify():
    tr = find_tr_src()
    with zipfile.ZipFile(tr) as z:
        q = z.read("modules/quests.xml").decode("utf-8")
        tr_loc = z.read("translation/quest_tr.xml").decode("utf-8")
    awards = None
    m = re.search(r'id="q2"[\s\S]*?</quest>', q)
    if m:
        block = m.group(0)
        def _tag(name):
            mm = re.search(r"<%s>(\d+)</%s>" % (name, name), block)
            return int(mm.group(1)) if mm else None
        awards = {"exp": _tag("exp"), "gold": _tag("gold"), "silver": _tag("silver")}

    relabeled = sorted(
        glob.glob(os.path.join(DATA_DIR, "config_all_tr_relabeled_*.zip"))
    )
    relabel_info = None
    if relabeled:
        rz = relabeled[-1]
        with zipfile.ZipFile(rz) as z:
            loc = z.read("translation/quest_tr.xml").decode("utf-8")
        relabel_info = {
            "path": rz,
            "locale_ru": bool(re.search(r'<locale name="ru">', loc)),
            "all_keys": {k: ('key="%s"' % k) in loc for k in RU_KEYS},
        }

    ru_text = open(RU_LOCALE, encoding="utf-8").read()
    with open(VERSIONS, encoding="utf-8") as f:
        versions = json.load(f)
    return {
        "tr_zip": tr,
        "q2_awards": awards,
        "tr_keys": {k: ('key="%s"' % k) in tr_loc for k in TR_KEYS},
        "ru_keys": {k: ('key="%s"' % k) in ru_text for k in RU_KEYS},
        "relabeled": relabel_info,
        "versions": {
            k: versions[k]
            for k in ("data/config_all_ru.zip", "data/config_all_tr.zip")
            if k in versions
        },
    }


def main():
    os.chdir(ROOT)
    print("Ensuring RU locale keys...")
    ru_added = ensure_locale_keys(RU_LOCALE, RU_KEYS)
    print("  RU added:", ru_added or "(none, already present)")

    retargeted = optional_retarget_q3(RU_QUESTS)
    print("  q3 retarget to #buyCafeCheeseCake:", retargeted)

    print("Repacking RU...")
    ru_zip = repack_ru()
    print(" ", ru_zip)

    print("Syncing TR...")
    info = sync_tr()
    print(" ", info)

    print("Verify...")
    print(json.dumps(verify(), indent=2, ensure_ascii=False))


if __name__ == "__main__":
    main()
