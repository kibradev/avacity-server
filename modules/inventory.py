import asyncio
import logging
import random
import re

from modules.base_module import Module
from modules.location import get_city_info
import modules.notify as notify

class_name = "Inventory"


# Every box always pays gold.  The item itself is an additional roll from the
# original Avataria pool in config_all_ru/modules/gifts/*.xml.
TIER_GOLD = {
    "small": (75, 175),
    "medium": (200, 500),
    "big": (600, 1500),
}

CATEGORY_WEIGHTS = {
    "small": {"clothes": 20, "furniture": 20, "other": 60},
    "medium": {"clothes": 35, "furniture": 25, "other": 40},
    "big": {"clothes": 55, "furniture": 25, "other": 20},
}


class Inventory(Module):
    prefix = "tr"

    def __init__(self, server):
        self.server = server
        self.commands = {"sale": self.sale_item, "opgft": self.open_gift}
        self._open_locks = {}

    async def sale_item(self, msg, client):
        items = self.server.game_items["game"]
        tpid = msg[2]["tpid"]
        cnt = msg[2]["cnt"]
        if tpid not in items or "saleSilver" not in items[tpid]:
            return
        if not await self.server.inv[client.uid].take_item(tpid, cnt):
            return
        price = items[tpid]["saleSilver"]
        user_data = await self.server.get_user_data(client.uid)
        redis = self.server.redis
        await redis.set(f"uid:{client.uid}:slvr", user_data["slvr"]+price*cnt)
        ci = await get_city_info(client.uid, self.server)
        await client.send(["ntf.ci", {"ci": ci}])
        inv = self.server.inv[client.uid].get()
        await client.send(["ntf.inv", {"inv": inv}])
        await notify.update_resources(client, self.server)

    @staticmethod
    def _tier(gift_id):
        value = gift_id.lower()
        if "small" in value or re.search(r"(?:gft|gift)\D*1$", value):
            return "small"
        if ("medium" in value or "middle" in value or
                re.search(r"(?:gft|gift)\D*2$", value)):
            return "medium"
        if ("big" in value or "large" in value or "vip" in value or
                re.search(r"(?:gft|gift)\D*3$", value)):
            return "big"
        if value.endswith("1"):
            return "small"
        if value.endswith("3"):
            return "big"
        return "medium"

    @staticmethod
    def _category_kind(category_id):
        value = category_id.lower()
        if "clothes" in value:
            return "clothes"
        if "furniture" in value or "furn" in value or "goldgift" in value:
            return "furniture"
        return "other"

    def _cloth_data(self, item_id, gender):
        clothes = self.server.modules["a"].clothes_list[gender]
        for category in clothes.values():
            if item_id in category:
                return category[item_id]
        return None

    def _item_type(self, item_id, gender):
        if self._cloth_data(item_id, gender) is not None:
            return "cls"
        if item_id in self.server.modules["frn"].frn_list:
            return "frn"
        if item_id in self.server.game_items["game"]:
            return "gm"
        return None

    async def _choose_loot(self, gift, tier, gender, uid):
        owned = await self.server.redis.smembers(f"uid:{uid}:items")
        available = []
        for category in gift["categories"]:
            # Currency is paid separately and should not consume the item roll.
            if category["id"].lower().startswith("resource"):
                continue
            items = []
            for item in category["items"]:
                if item["gender"] and item["gender"] != gender:
                    continue
                item_type = self._item_type(item["id"], gender)
                if item_type is None:
                    continue
                if item_type == "cls" and item["id"] in owned:
                    continue
                items.append((item, item_type))
            if items:
                available.append((category, items,
                                  self._category_kind(category["id"])))
        if not available:
            return None

        kinds = []
        weights = []
        for kind in ("clothes", "furniture", "other"):
            if any(entry[2] == kind for entry in available):
                kinds.append(kind)
                weights.append(CATEGORY_WEIGHTS[tier][kind])
        chosen_kind = random.choices(kinds, weights=weights, k=1)[0]
        categories = [entry for entry in available if entry[2] == chosen_kind]
        category, items, _kind = random.choice(categories)
        selected, item_type = random.choices(
            items,
            weights=[max(0.001, value[0]["probability"])
                     for value in items],
            k=1,
        )[0]
        return {
            "id": selected["id"],
            "count": random.randint(selected["min"], selected["max"]),
            "type": item_type,
            "category": category["id"],
        }

    async def open_gift(self, msg, client):
        gift_id = msg[2].get("tpid")
        gift = self.server.gift_boxes.get(gift_id)
        if gift is None:
            logging.warning("unknown gift box uid=%s item=%r",
                            client.uid, gift_id)
            return
        lock = self._open_locks.setdefault(client.uid, asyncio.Lock())
        async with lock:
            appearance = await self.server.get_appearance(client.uid)
            if not appearance:
                return
            gender = "boy" if appearance["g"] == 1 else "girl"
            tier = self._tier(gift_id)
            loot = await self._choose_loot(gift, tier, gender, client.uid)
            if loot is None:
                logging.error("gift box has no valid loot uid=%s item=%s",
                              client.uid, gift_id)
                return
            # Consume only after a valid reward has been selected.
            if not await self.server.inv[client.uid].take_item(gift_id, 1):
                return

            gold = random.randint(*TIER_GOLD[tier])
            await self.server.redis.incrby(f"uid:{client.uid}:gld", gold)
            await self.server.inv[client.uid].add_item(
                loot["id"], loot["type"], loot["count"])
            if loot["type"] == "cls":
                cloth = self._cloth_data(loot["id"], gender)
                if cloth and cloth.get("rating"):
                    await self.server.redis.incrby(
                        f"uid:{client.uid}:crt", cloth["rating"])
            await self.server.redis.incrby(
                f"uid:{client.uid}:giftboxes_opened", 1)

            result_item = {
                "tid": loot["id"], "iid": "", "c": loot["count"],
            }
            await client.send(["tr.opgft", {
                "res": {"gld": gold, "slvr": 0, "enrg": 0},
                "ctid": gift["group"],
                "lt": {"id": loot["category"], "it": [result_item]},
            }])
            await client.send(["ntf.inv", {
                "inv": self.server.inv[client.uid].get(),
            }])
            ci = await get_city_info(client.uid, self.server)
            await client.send(["ntf.ci", {"ci": ci}])
            await notify.update_resources(client, self.server)
            logging.info(
                "gift opened uid=%s box=%s tier=%s gold=%s loot=%sx%s",
                client.uid, gift_id, tier, gold, loot["id"], loot["count"])
