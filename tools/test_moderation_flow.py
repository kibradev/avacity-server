#!/usr/bin/env python3
import asyncio
import os
import sys
import xml.etree.ElementTree as ElementTree


BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, BASE)
os.chdir(BASE)

from modules.component import Component  # noqa: E402
from modules.console import Console  # noqa: E402
from modules.support import Support  # noqa: E402


class FakePipeline:
    def __init__(self, redis):
        self.redis = redis
        self.operations = []

    def set(self, key, value):
        self.operations.append(("set", key, value))
        return self

    async def execute(self):
        for _, key, value in self.operations:
            await self.redis.set(key, value)
        return [True] * len(self.operations)


class FakeRedis:
    def __init__(self):
        self.values = {}
        self.lists = {}

    async def get(self, key):
        return self.values.get(key)

    async def set(self, key, value):
        self.values[key] = str(value)
        return True

    async def delete(self, *keys):
        for key in keys:
            self.values.pop(key, None)
            self.lists.pop(key, None)

    async def incr(self, key):
        value = int(self.values.get(key, 0)) + 1
        self.values[key] = str(value)
        return value

    async def lpush(self, key, value):
        self.lists.setdefault(key, []).insert(0, value)

    async def ltrim(self, key, start, end):
        values = self.lists.get(key, [])
        self.lists[key] = values[start:] if end == -1 else values[start:end + 1]

    async def lrange(self, key, start, end):
        values = self.lists.get(key, [])
        return values[start:] if end == -1 else values[start:end + 1]

    def pipeline(self):
        return FakePipeline(self)


class FakeParser:
    @staticmethod
    def parse_privileges():
        root = ElementTree.parse("config_all_ru/modules/acl.xml").getroot()
        return {item.attrib["name"]: int(item.attrib["minAuthority"])
                for item in root.findall(".//privilege")}


class FakeWriter:
    def __init__(self):
        self.closed = False

    def close(self):
        self.closed = True


class FakeClient:
    def __init__(self, uid, room=None):
        self.uid = str(uid)
        self.room = room
        self.sent = []
        self.writer = FakeWriter()

    async def send(self, message, type_=34):
        self.sent.append((type_, message))


class FakeServer:
    def __init__(self):
        self.redis = FakeRedis()
        self.parser = FakeParser()
        self.modules = {}
        self.online = {}
        self.rooms = {"street_st1_1": []}
        self.roles = {"1": 1, "2": 2, "3": 3, "4": 4, "5": 2,
                      "10": 0, "11": 0, "12": 0}

    async def get_user_data(self, uid):
        uid = str(uid)
        if uid not in self.roles:
            return None
        return {"uid": uid, "role": self.roles[uid]}

    async def get_appearance(self, uid):
        return {"n": f"user-{uid}"} if str(uid) in self.roles else False


def last_message(client, command):
    for _, message in reversed(client.sent):
        if message[0] == command:
            return message[1]
    raise AssertionError(f"No {command} response: {client.sent}")


async def run():
    server = FakeServer()
    component = Component(server)
    support = Support(server)
    console = Console(server)
    server.modules.update({"cp": component, "spt": support,
                           "console": console})

    trainee = FakeClient("1")
    moderator = FakeClient("2")
    top_moderator = FakeClient("3")
    curator = FakeClient("4")
    equal_moderator = FakeClient("5")
    users = {uid: FakeClient(uid, "street_st1_1")
             for uid in ("10", "11", "12")}
    server.online.update(users)
    server.rooms["street_st1_1"] = list(users)

    await support.init([None, "spt.init", {}], trainee)
    assert last_message(trainee, "spt.init")["a"] is True
    await support.init([None, "spt.init", {}], users["10"])
    assert last_message(users["10"], "spt.init")["a"] is False
    await console.access_level([None, "console.acclvl", {}], curator)
    assert last_message(curator, "console.acclvl")["level"] == 4

    await component.moderation(
        [None, "cp.m.ar", {"pvlg": "AVATAR_BAN"}], trainee)
    assert last_message(trainee, "cp.m.ar")["sccss"] is False
    await component.moderation(
        [None, "cp.m.ar", {"pvlg": "DOES_NOT_EXIST"}], curator)
    assert last_message(curator, "cp.m.ar")["sccss"] is False

    # Rule 7 is a 30-minute avatar ban. Role 2 may apply it to a user.
    await component.moderation(
        [None, "cp.m.bu", {"uid": "10", "bctr": 7, "tm": 0,
                            "notes": "flood"}], moderator)
    response = last_message(moderator, "cp.m.bu")
    assert response["sccss"] is True
    assert response["bu"]["reasonId"] == 11
    assert users["10"].writer.closed is True

    # Equal authority and insufficient authority are rejected with a reply.
    await component.moderation(
        [None, "cp.m.bu", {"uid": "5", "bctr": 7}], moderator)
    assert last_message(moderator, "cp.m.bu")["sccss"] is False
    await component.moderation(
        [None, "cp.m.bu", {"uid": "11", "bctr": 7}], trainee)
    assert last_message(trainee, "cp.m.bu")["sccss"] is False

    # Thirty-day rules require TOP_MODERATOR; effectively permanent rules
    # require CURATOR/ALLOW_BAN_ALWAYS.
    await component.moderation(
        [None, "cp.m.bu", {"uid": "11", "bctr": 12}], moderator)
    assert last_message(moderator, "cp.m.bu")["sccss"] is False
    await component.moderation(
        [None, "cp.m.bu", {"uid": "11", "bctr": 12}], top_moderator)
    assert last_message(top_moderator, "cp.m.bu")["sccss"] is True
    await component.moderation(
        [None, "cp.m.bu", {"uid": "12", "bctr": 20}], top_moderator)
    assert last_message(top_moderator, "cp.m.bu")["sccss"] is False
    await component.moderation(
        [None, "cp.m.bu", {"uid": "12", "bctr": 20}], curator)
    assert last_message(curator, "cp.m.bu")["sccss"] is True

    # Chat bans persist in Redis and both query/unban commands use the
    # protocol shapes consumed by the exported client.
    await component.moderation(
        [None, "cp.m.bcu", {"uid": "10", "tm": 5,
                             "notes": "spam"}], trainee)
    chat_response = last_message(trainee, "cp.m.bcu")
    assert chat_response["sccss"] is True
    assert chat_response["bcu"]["mbd"] == 5
    await component.moderation(
        [None, "cp.m.ccub", {"uid": "10"}], trainee)
    assert last_message(trainee, "cp.m.ccub")["bcu"] is not None
    await component.moderation(
        [None, "cp.m.ucu", {"uid": "10"}], trainee)
    assert last_message(trainee, "cp.m.ucu")["sccss"] is True

    # Only role 3+ can read the audit trail; denied requests still receive
    # the callback-closing empty response.
    await support.load_moderator_actions(
        [None, "spt.lmdac", {"uid": "10"}], moderator)
    assert last_message(moderator, "spt.lmdac")["acts"] == []
    await support.load_moderator_actions(
        [None, "spt.lmdac", {"uid": "10"}], top_moderator)
    actions = last_message(top_moderator, "spt.lmdac")["acts"]
    assert {action["act"] for action in actions} >= {"ban", "chatBan",
                                                    "chatUnban"}

    print("moderation flow: OK")


if __name__ == "__main__":
    asyncio.run(run())
