#!/usr/bin/env python3
"""Isolated gift-box transaction and native-pool validation test."""
import asyncio
import random
import sys

sys.path.insert(0, "/opt/avacity/base")
from server import Server
import modules.inventory as inventory_module


class FakeRedis:
    def __init__(self):
        self.values = {"uid:999:gld": 0, "uid:999:crt": 0}
        self.owned = set()

    async def smembers(self, key):
        if key == "uid:999:items":
            return set(self.owned)
        return set()

    async def incrby(self, key, amount):
        self.values[key] = self.values.get(key, 0) + amount
        return self.values[key]


class FakeInventory:
    def __init__(self, redis, box):
        self.redis = redis
        self.box = box
        self.items = {box: ("gm", 1)}
        redis.owned.add(box)

    async def take_item(self, item, amount=1):
        if item != self.box or self.items.get(item, (None, 0))[1] < amount:
            return False
        del self.items[item]
        self.redis.owned.discard(item)
        return True

    async def add_item(self, item, item_type, amount=1):
        self.items[item] = (item_type, amount)
        self.redis.owned.add(item)

    def get(self):
        return {"test": self.items}


class FakeClient:
    uid = 999

    def __init__(self):
        self.messages = []

    async def send(self, message, type_=34):
        self.messages.append(message)


async def no_resource_update(client, server):
    return None


async def empty_city_info(uid, server):
    return {}


async def main():
    random.seed(20260722)
    server = Server()
    assert len(server.gift_boxes) >= 20
    inventory_module.notify.update_resources = no_resource_update
    inventory_module.get_city_info = empty_city_info

    async def appearance(uid):
        return {"g": 1}

    server.get_appearance = appearance
    expected_ranges = {
        "smallPersonalGift": (75, 175),
        "mediumPersonalGift": (200, 500),
        "bigPersonalGift": (600, 1500),
    }
    for box, (minimum, maximum) in expected_ranges.items():
        redis = FakeRedis()
        server.redis = redis
        inv = FakeInventory(redis, box)
        server.inv = {999: inv}
        client = FakeClient()
        await server.modules["tr"].open_gift(
            [None, "tr.opgft", {"tpid": box}], client)
        assert box not in inv.items
        assert minimum <= redis.values["uid:999:gld"] <= maximum
        rewards = [item for item in inv.items if item != box]
        assert len(rewards) == 1
        response = next(msg for msg in client.messages
                        if msg[0] == "tr.opgft")
        assert response[1]["lt"]["it"][0]["tid"] == rewards[0]
        assert response[1]["res"]["gld"] == redis.values["uid:999:gld"]
        print(box, response[1]["res"], response[1]["lt"])
    print("OK: 22 native boxes indexed; all personal tiers open atomically")


if __name__ == "__main__":
    asyncio.run(main())
