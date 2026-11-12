#!/usr/bin/env python3
"""Validate curated level quests, task parsing and RU/TR localization."""

import asyncio
import json
from pathlib import Path
import sys
import zipfile

from lxml import etree


ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT))

from modules.quest import LEVEL_QUESTS, Quest
from xml_parser import Parser


def locale_keys(data):
    root = etree.fromstring(data.encode("utf-8"))
    return {message.get("key") for message in root.findall(".//message")}


class FakeRedis:
    def __init__(self):
        self.sets = {}

    async def smembers(self, key):
        return set(self.sets.get(key, set()))

    async def sismember(self, key, value):
        return value in self.sets.get(key, set())

    async def sadd(self, key, *values):
        self.sets.setdefault(key, set()).update(values)


class FakeServer:
    def __init__(self):
        self.parser = Parser()
        self.redis = FakeRedis()
        self.exp = 410

    async def get_user_data(self, _uid):
        return {"exp": self.exp}

    async def get_appearance(self, _uid):
        return {"g": 1}


async def verify_unlocks():
    server = FakeServer()
    quests = Quest(server)
    await quests.sync_available_quests("test")
    active = await server.redis.smembers("uid:test:quests:active")
    assert active == {"q31", "q6"}

    # A large reward can skip levels; all curated quests up to the resulting
    # level must still unlock, while girl-only variants stay hidden.
    server.exp = 800
    await quests.sync_available_quests("test")
    active = await server.redis.smembers("uid:test:quests:active")
    expected = {"q31", "q6", "q27", "q28", "q108", "q79boy",
                "q105", "q63", "q59"}
    assert active == expected, active


def main():
    parsed = Parser().parse_quests()
    quest_doc = etree.parse(str(ROOT / "config_all_ru/modules/quests.xml"))
    ru_data = (ROOT / "config_all_ru/translation/quest_ru.xml").read_text()
    versions = json.loads((ROOT / "files/versions.json").read_text())
    tr_hash = versions["data/config_all_tr.zip"]
    tr_zip = ROOT / "files/data" / f"config_all_tr_{tr_hash}.zip"
    with zipfile.ZipFile(tr_zip) as archive:
        tr_data = archive.read("translation/quest_tr.xml").decode("utf-8")
    translations = {"ru": locale_keys(ru_data), "tr": locale_keys(tr_data)}

    selected = [qid for qids in LEVEL_QUESTS.values() for qid in qids]
    assert min(LEVEL_QUESTS) == 2 and max(LEVEL_QUESTS) == 10
    assert all(3 <= len(qids) <= 5 for level, qids in LEVEL_QUESTS.items()
               if level >= 5)
    missing = []
    for qid in selected:
        assert qid in parsed, qid
        quest = quest_doc.xpath(f'./quest[@id="{qid}"]')[0]
        refs = {
            node.text[1:] for node in quest.xpath(
                "./title|./description|./comment|./tasks/task/@title")
            if isinstance(node, etree._Element) and node.text and
            node.text.startswith("#")
        }
        refs.update(value[1:] for value in quest.xpath("./tasks/task/@title")
                    if value.startswith("#"))
        for locale, keys in translations.items():
            for key in refs:
                if key not in keys:
                    missing.append((locale, qid, key))
    assert not missing, missing

    craft = parsed["q193"]["tasks"][0]
    work = parsed["q109"]["tasks"][0]
    assert craft["items"] == ["saber"]
    assert work["workId"] == "garden"
    asyncio.run(verify_unlocks())
    print(f"level quest checks passed: {len(selected)} definitions, RU/TR localized")


if __name__ == "__main__":
    main()
