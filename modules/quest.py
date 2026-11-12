from modules.base_module import Module
import modules.notify as notify
from modules.location import get_city_info

class_name = "Quest"


# Keep the early game busy without activating hundreds of expired event and
# profession quests that happen to share the same playerLevel rule.
LEVEL_QUESTS = {
    2: ("q31", "q6"),
    5: ("q27", "q28", "q108", "q79boy", "q79girl"),
    6: ("q105", "q63", "q59"),
    7: ("q193", "q109", "q57", "q61"),
    8: ("q94", "q74", "q77", "q80boy", "q80girl"),
    9: ("q100", "q60", "q139"),
    10: ("q110", "q106", "q116", "q161"),
}


def get_level(exp):
    exp_sum = 0
    i = 0
    while exp_sum <= exp:
        i += 1
        exp_sum += i * 50
    return i


class Quest(Module):
    prefix = "q"

    def __init__(self, server):
        self.server = server
        self.commands = {"get": self.get_quests, "ubq": self.take_quest,
                         "btsk": self.buy_task, "umq": self.update_module_quests}
        self.quests = server.parser.parse_quests()

    async def get_quests(self, msg, client):
        await client.send(["q.get", {"qc": await self.get_collection(client.uid)}])

    async def update_module_quests(self, msg, client):
        # No event/profession module quests implemented yet - the base
        # quests.xml chain doesn't need this, but the client polls it when
        # opening the quests dialog, so it must get *some* reply.
        await client.send(["q.umq", {}])

    async def get_collection(self, uid):
        await self.sync_available_quests(uid)
        active = await self.server.redis.smembers(f"uid:{uid}:quests:active")
        return {"q": [await self.get_quest_instance(uid, qid)
                      for qid in active]}

    async def get_quest_instance(self, uid, qid):
        redis = self.server.redis
        quest = self.quests.get(qid)
        ts = []
        if quest:
            for ind, task in enumerate(quest["tasks"]):
                progress = await redis.get(f"uid:{uid}:quest:{qid}:task:{ind}")
                ts.append({"ind": ind, "tp": task["type"],
                           "pr": int(progress) if progress else 0})
        return {"qid": qid, "ts": ts}

    async def grant_initial_quests(self, client):
        for qid, quest in self.quests.items():
            if quest["initial"]:
                await self.grant_quest(client, qid)

    async def sync_available_quests(self, uid):
        """Activate initial and curated quests valid for the current level."""
        redis = self.server.redis
        candidates = [qid for qid, quest in self.quests.items()
                      if quest["initial"]]
        user_data = await self.server.get_user_data(uid)
        current_level = get_level(user_data["exp"])
        curated = set()
        for level, qids in LEVEL_QUESTS.items():
            if level <= min(current_level, 10):
                candidates.extend(qids)
                curated.update(qids)
        for qid in candidates:
            quest = self.quests.get(qid)
            if not quest:
                continue
            if await redis.sismember(f"uid:{uid}:quests:completed", qid):
                continue
            if await redis.sismember(f"uid:{uid}:quests:active", qid):
                continue
            if await self.rules_satisfied(
                    uid, quest["rules"],
                    ignore_player_level=qid in curated):
                await redis.sadd(f"uid:{uid}:quests:active", qid)

    async def grant_quest(self, client, qid):
        quest = self.quests.get(qid)
        if not quest:
            return
        redis = self.server.redis
        if await redis.sismember(f"uid:{client.uid}:quests:completed", qid):
            return
        if await redis.sismember(f"uid:{client.uid}:quests:active", qid):
            return
        if not await self.rules_satisfied(client.uid, quest["rules"]):
            return
        await redis.sadd(f"uid:{client.uid}:quests:active", qid)
        instance = await self.get_quest_instance(client.uid, qid)
        await client.send(["q.prgr", {"q": instance}])
        # Tasks with no real gameplay trigger (e.g. the tutorial's closing
        # "finishTutorial" marker) complete themselves as soon as offered.
        for ind, task in enumerate(quest["tasks"]):
            if task["type"] == "finishTutorial":
                await self.set_task_progress(client, qid, ind,
                                             task["maxProgress"])

    async def rules_satisfied(self, uid, rules, ignore_player_level=False):
        redis = self.server.redis
        for needed in rules["neededQuest"]:
            if not await redis.sismember(f"uid:{uid}:quests:completed",
                                         needed):
                return False
        if rules["playerLevel"] and not ignore_player_level:
            user_data = await self.server.get_user_data(uid)
            level = get_level(user_data["exp"])
            min_lvl, max_lvl = rules["playerLevel"]
            if level < min_lvl or level > max_lvl:
                return False
        if rules["gender"]:
            apprnc = await self.server.get_appearance(uid)
            gender = "boy" if apprnc["g"] == 1 else "girl"
            if gender != rules["gender"]:
                return False
        return True

    async def take_quest(self, msg, client):
        await self.grant_quest(client, msg[2]["qid"])

    async def buy_task(self, msg, client):
        qid = msg[2]["q"]
        ind = msg[2]["ind"]
        quest = self.quests.get(qid)
        if not quest or ind >= len(quest["tasks"]):
            return
        if not await self.server.redis.sismember(
                f"uid:{client.uid}:quests:active", qid):
            return
        task = quest["tasks"][ind]
        price = task["gold"]
        if not price:
            return
        user_data = await self.server.get_user_data(client.uid)
        if user_data["gld"] < price:
            return
        await self.server.redis.set(f"uid:{client.uid}:gld",
                                    user_data["gld"] - price)
        await notify.update_resources(client, self.server)
        await self.set_task_progress(client, qid, ind, task["maxProgress"])

    async def progress_task(self, client, task_type, item=None,
                            location_id=None, work_id=None, amount=1):
        """Called by other modules when a matching gameplay event happens
        (placing furniture, wearing clothes, buying an item, dancing...)."""
        redis = self.server.redis
        active = await redis.smembers(f"uid:{client.uid}:quests:active")
        for qid in active:
            quest = self.quests.get(qid)
            if not quest:
                continue
            for ind, task in enumerate(quest["tasks"]):
                if task["type"] != task_type:
                    continue
                if task["items"] and item not in task["items"]:
                    continue
                if task["locationId"] and task["locationId"] != location_id:
                    continue
                if task["workId"] and task["workId"] != work_id:
                    continue
                progress = await redis.get(
                    f"uid:{client.uid}:quest:{qid}:task:{ind}")
                progress = int(progress) if progress else 0
                if progress >= task["maxProgress"]:
                    continue
                await self.set_task_progress(client, qid, ind,
                                             progress + max(1, int(amount)))

    async def set_task_progress(self, client, qid, ind, progress):
        quest = self.quests[qid]
        task = quest["tasks"][ind]
        progress = min(progress, task["maxProgress"])
        await self.server.redis.set(
            f"uid:{client.uid}:quest:{qid}:task:{ind}", progress)
        instance = await self.get_quest_instance(client.uid, qid)
        await client.send(["q.prgr", {"q": instance}])
        if all(t["pr"] >= quest["tasks"][t["ind"]]["maxProgress"]
              for t in instance["ts"]):
            await self.complete_quest(client, qid)

    async def complete_quest(self, client, qid):
        redis = self.server.redis
        quest = self.quests.get(qid)
        if not quest:
            return
        if await redis.sismember(f"uid:{client.uid}:quests:completed", qid):
            return
        user_data = await self.server.get_user_data(client.uid)
        old_level = get_level(user_data["exp"])
        award = quest["award"]
        exp = user_data["exp"] + award.get("exp", 0)
        energy = user_data["enrg"] + award.get("energy", 0)
        gold = user_data["gld"] + award.get("gold", 0)
        silver = user_data["slvr"] + award.get("silver", 0)
        pipe = redis.pipeline()
        pipe.set(f"uid:{client.uid}:exp", exp)
        pipe.set(f"uid:{client.uid}:enrg", energy)
        pipe.set(f"uid:{client.uid}:gld", gold)
        pipe.set(f"uid:{client.uid}:slvr", silver)
        pipe.srem(f"uid:{client.uid}:quests:active", qid)
        pipe.sadd(f"uid:{client.uid}:quests:completed", qid)
        await pipe.execute()
        for item in award.get("items", []):
            await self.server.inv[client.uid].add_item(
                item["typeId"], "gm", item["count"])
        instance = await self.get_quest_instance(client.uid, qid)
        ci = await get_city_info(client.uid, self.server)
        user_data = await self.server.get_user_data(client.uid)
        res = {"gld": user_data["gld"], "slvr": user_data["slvr"],
              "emd": user_data["emd"], "enrg": user_data["enrg"]}
        await client.send(["q.cmpl", {"q": instance, "ci": ci, "res": res}])
        new_level = get_level(exp)
        if new_level > old_level:
            await client.send(["q.nwlv", {"lv": new_level}])
            await self.sync_available_quests(client.uid)
            for new_qid in LEVEL_QUESTS.get(new_level, ()):
                if await redis.sismember(
                        f"uid:{client.uid}:quests:active", new_qid):
                    await client.send([
                        "q.prgr",
                        {"q": await self.get_quest_instance(client.uid,
                                                             new_qid)},
                    ])
        for next_qid, next_quest in self.quests.items():
            if qid in next_quest["rules"]["neededQuest"]:
                await self.grant_quest(client, next_qid)
