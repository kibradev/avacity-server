#!/usr/bin/env python3
"""Self-contained checks for achievement thresholds and trophy ownership."""

import asyncio
import json
from pathlib import Path
import sys
import zipfile


ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT))

from modules.achievements import add_progress, build_collection
from xml_parser import Parser


class FakeRedis:
    def __init__(self):
        self.values = {}
        self.sets = {}

    async def get(self, key):
        return self.values.get(key)

    async def delete(self, key):
        self.values.pop(key, None)
        self.sets.pop(key, None)

    async def incrby(self, key, amount):
        self.values[key] = int(self.values.get(key, 0)) + amount
        return self.values[key]

    async def smembers(self, key):
        return set(self.sets.get(key, set()))

    async def sadd(self, key, *values):
        self.sets.setdefault(key, set()).update(values)


class FakeServer:
    def __init__(self):
        parser = Parser()
        self.achievements = parser.parse_achievements()
        self.trophies = parser.parse_trophies()
        self.redis = FakeRedis()


def verify_archives():
    versions = json.loads((ROOT / "files" / "versions.json").read_text())
    for locale in ("ru", "tr"):
        digest = versions[f"data/config_all_{locale}.zip"]
        path = ROOT / "files" / "data" / f"config_all_{locale}_{digest}.zip"
        with zipfile.ZipFile(path) as archive:
            data = archive.read("modules/achievements.xml").decode("utf-8")
        assert "achievement thresholds scaled x3" in data
        assert data.count("winCount=") == 78


async def main():
    verify_archives()
    server = FakeServer()
    assert len(server.achievements) == 26
    assert sum(len(value["grades"])
               for value in server.achievements.values()) == 78
    assert [grade["winCount"] for grade in
            server.achievements["crafter"]["grades"]] == [9, 30, 75]

    initial = await build_collection("test", server)
    assert all(value["l"] == 0 for value in initial["ac"].values())
    assert initial["tr"] == {}

    assert await add_progress("test", server, "crafter", 8) == []
    assert await add_progress("test", server, "crafter", 1) == [
        "crafterBronze"]
    progressed = await build_collection("test", server)
    assert progressed["ac"]["crafter"] == {
        "p": 9, "nWct": 30, "l": 1, "aId": "crafter"}
    assert set(progressed["tr"]) == {"crafterBronze"}
    print("achievement checks passed: 26 achievements, 78 trophies, x3 limits")


if __name__ == "__main__":
    asyncio.run(main())
