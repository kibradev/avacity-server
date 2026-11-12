import os
import time
import asyncio
import logging
from modules.location import Location, gen_plr
from modules.achievements import build_collection
from inventory import Inventory
import const

class_name = "House"

# The client's in-game avatar-creation screen is broken in this build (the
# gender "выбрать" button emits no command), so new accounts can never finish
# character creation. Until that flow is fixed client-side, the server
# auto-provisions a default avatar + starter rooms/clothes the first time a
# user logs in without one, letting them enter the game directly.
# 1 = boy, 2 = girl.
DEFAULT_GENDER = 1


class House(Location):
    prefix = "h"

    def __init__(self, server):
        super().__init__(server)
        self.kicked = {}
        self.commands.update({"minfo": self.get_my_info, "gr": self.get_room,
                              "oinfo": self.owner_info,
                              "ioinfo": self.init_owner_info})

    async def get_my_info(self, msg, client):
        if msg[2].get("onl"):
            logging.info("h.minfo onl-only uid=%s", client.uid)
            return await client.send(["h.minfo", {"scs": True}])
        apprnc = await self.server.get_appearance(client.uid)
        if not apprnc:
            # Diagnostic: checked on every request (not cached at import
            # time) so it survives a plain `tools/launch.py` restart, which
            # does not preserve environment variables set in a prior shell.
            # Lets a fresh account hit the client's real avatar-creation
            # screen instead of being auto-provisioned, to verify the
            # cmd_alias fix for a.apprnc.save end-to-end. Remove this file
            # (and this branch) once that flow is confirmed working.
            if os.path.exists("/tmp/skip_auto_provision"):
                logging.info("h.minfo no avatar uid=%s -> "
                             "/tmp/skip_auto_provision present, sending "
                             "has.avtr=False", client.uid)
                return await client.send(["h.minfo", {"has.avtr": False}])
            logging.info("h.minfo no avatar uid=%s -> auto-provisioning "
                         "default (gender=%s)", client.uid, DEFAULT_GENDER)
            await self._provision_default_avatar(client.uid)
            apprnc = await self.server.get_appearance(client.uid)
            if not apprnc:
                logging.warning("auto-provision failed uid=%s, falling back "
                                "to has.avtr=False", client.uid)
                return await client.send(["h.minfo", {"has.avtr": False}])
        user_data = await self.server.get_user_data(client.uid)
        if client.uid not in self.server.inv:
            self.server.inv[client.uid] = Inventory(self.server, client.uid)
            await self.server.inv[client.uid]._get_inventory()
        inv = self.server.inv[client.uid].get()
        cs = await self.server.get_clothes(client.uid, type_=1)
        rooms = []
        for item in await self.server.redis.smembers(f"rooms:{client.uid}"):
            room = await self.server.redis.lrange(f"rooms:{client.uid}:{item}",
                                                  0, -1)
            room_items = await self.server.get_room_items(client.uid, item)
            rooms.append({"f": room_items,
                          "w": 13, "id": item, "lev": int(room[1]),
                          "lvl": int(room[1]), "tgs": [], "l": 13,
                          "nm": room[0]})
            await asyncio.sleep(0.1)
        achc = await build_collection(
            client.uid, self.server, user_data["premium"])
        plr = await gen_plr(client, self.server)
        plr.update({"cs": cs, "hs": {"r": rooms, "lt": 0}, "inv": inv,
                    "onl": True, "achc": achc})
        plr["res"] = {"slvr": user_data["slvr"], "enrg": user_data["enrg"],
                      "emd": user_data["emd"], "gld": user_data["gld"]}
        logging.info("h.minfo sending full plr uid=%s nick=%s rooms=%s",
                     client.uid, apprnc.get("n"), len(rooms))
        await client.send(["h.minfo", {"plr": plr, "tm": 1}])
        await self._perform_login(client)
        logging.info("h.minfo + login extras sent uid=%s", client.uid)

    async def _provision_default_avatar(self, uid):
        """Seed a default avatar, starter clothes and rooms for a fresh uid.

        Mirrors tools/seed_avatar.py but runs against the async redis client so
        that any account which reaches the (broken) creation screen is instead
        dropped straight into a playable house.
        """
        r = self.server.redis
        gender = DEFAULT_GENDER
        nick = await r.get(f"uid:{uid}:nick") or f"Player{uid}"
        # appearance layout matches server.get_appearance ordering
        apprnc = [nick, 0, gender] + [1] * 22
        await r.delete(f"uid:{uid}:appearance")
        await r.rpush(f"uid:{uid}:appearance", *apprnc)

        # Match the client's own initDefaultClothes() IDs (pnz-city.swf),
        # not the older avacity clothing set.
        if gender == 1:
            weared = ["boySMR14Sh3", "boyRshPnt", "boyTShrtHsk"]
            available = []
        else:
            weared = ["girlBtsPnd", "girlPntsPnd", "girlTShrtPnd"]
            available = []

        await r.set(f"uid:{uid}:wearing", "casual")
        for ctp in ("casual", "club", "official", "swimwear", "underdress"):
            await r.delete(f"uid:{uid}:{ctp}")
        for item in weared + available:
            await r.sadd(f"uid:{uid}:items", item)
            await r.delete(f"uid:{uid}:items:{item}")
            await r.rpush(f"uid:{uid}:items:{item}", "cls", 1)
        for item in weared:
            await r.sadd(f"uid:{uid}:casual", item)

        # Accounts created via the social adapter's addUser lack default rooms
        # (only /register creates them), so make sure they exist.
        if not await r.smembers(f"rooms:{uid}"):
            await r.sadd(f"rooms:{uid}", "livingroom")
            await r.rpush(f"rooms:{uid}:livingroom", "#livingRoom", 1)
            for i in range(1, 6):
                await r.sadd(f"rooms:{uid}", f"room{i}")
                await r.rpush(f"rooms:{uid}:room{i}", f"Комната {i}", 2)

        for room in await r.smembers(f"rooms:{uid}"):
            for item in const.room_items:
                key = f"{item['tpid']}_{item['oid']}"
                await r.sadd(f"rooms:{uid}:{room}:items", key)
                await r.delete(f"rooms:{uid}:{room}:items:{key}")
                await r.rpush(f"rooms:{uid}:{room}:items:{key}",
                              item["x"], item["y"], item["z"], item["d"])
                if "rid" in item:
                    await r.sadd(f"rooms:{uid}:{room}:items:{key}:options",
                                 "rid")
                    if item["rid"]:
                        await r.set(f"rooms:{uid}:{room}:items:{key}:rid",
                                    item["rid"])

        for k, v in (("slvr", 1000), ("gld", 50), ("enrg", 100), ("emd", 0),
                     ("exp", 0), ("crt", 0), ("hrt", 0)):
            if not await r.exists(f"uid:{uid}:{k}"):
                await r.set(f"uid:{uid}:{k}", v)
        logging.info("auto-provisioned default avatar+rooms uid=%s gender=%s",
                     uid, gender)

    async def owner_info(self, msg, client):
        uid = msg[2]["uid"]
        if not uid:
            return
        if uid in self.kicked and client.uid in self.kicked[uid]:
            return await client.send(["h.oinfo", {"kc": True}])
        plr = await gen_plr(uid, self.server)
        rooms = []
        tmp = await self.server.redis.smembers(f"rooms:{uid}")
        for item in tmp:
            room = await self.server.redis.lrange(f"rooms:{uid}:{item}", 0, -1)
            room_items = await self.server.get_room_items(uid, item)
            rooms.append({"f": room_items, "w": 13, "l": 13, "id": item,
                          "lev": int(room[1]), "lvl": int(room[1]),
                          "tgs": [], "nm": room[0]})
            await asyncio.sleep(0.1)
        ath = False
        for room_orig in self.server.rooms:
            room = room_orig.split("_")
            if room[0] == "house" and room[1] == uid:
                if uid in self.server.rooms[room_orig]:
                    ath = True
                    break
        await client.send(["h.oinfo", {"ath": ath, "plr": plr,
                                       "hs": {"r": rooms, "lt": 0}}])

    async def init_owner_info(self, msg, client):
        uid = msg[2]["uid"]
        if not uid:
            return
        plr = await gen_plr(uid, self.server)
        ath = False
        for room_orig in self.server.rooms:
            room = room_orig.split("_")
            if room[0] == "house" and room[1] == uid:
                if uid in self.server.rooms[room_orig]:
                    ath = True
                    break
        await client.send("h.ioinfo", {"tids": [], "ath": ath, "plr": plr})

    async def get_room(self, msg, client):
        room = f"{msg[2]['lid']}_{msg[2]['gid']}_{msg[2]['rid']}"
        if client.room:
            await self.leave_room(client)
        if msg[2]["gid"] in self.kicked and \
           client.uid in self.kicked[msg[2]["gid"]]:
            return
        await self.join_room(client, room)
        if client.uid == msg[2]["gid"]:
            await self.owner_at_house(client.uid, True)
        await client.send(["h.gr", {"rid": client.room}])

    async def owner_at_house(self, owner, ath):
        for room_orig in self.server.rooms.copy():
            room = room_orig.split("_")
            if room[0] == "house" and room[1] == owner:
                for uid in self.server.rooms[room_orig].copy():
                    try:
                        tmp = self.server.online[uid]
                    except KeyError:
                        continue
                    await tmp.send(["h.oah", {"ath": ath}])

    async def room(self, msg, client):
        subcommand = msg[1].split(".")[2]
        if subcommand == "info":
            rmmb = []
            try:
                room = self.server.rooms[msg[0]].copy()
            except KeyError:
                await client.send(["cp.ms.rsm", {"txt": "Произошла ошибка, "
                                                        "перезайдите в игру"}])
                return
            online = self.server.online
            for uid in room:
                try:
                    tmp = online[uid]
                except KeyError:
                    continue
                rmmb.append(await gen_plr(tmp, self.server))
            room_addr = f"rooms:{msg[2]['uid']}:{msg[2]['rid']}"
            tmp = await self.server.redis.lrange(room_addr, 0, -1)
            if not tmp:
                await client.send(["cp.ms.rsm", {"txt": "Комната не найдена, "
                                                        "напишите в "
                                                        "техподдержку"
                                                        f"({room_addr})"}])
                return
            room_items = await self.server.get_room_items(msg[2]["uid"],
                                                          msg[2]["rid"])
            if os.environ.get("DEBUG_EMPTY_FURNITURE"):
                # Temporary diagnostic: isolate whether the client-side
                # loading hang comes from furniture rendering (createObject/
                # renderItems) vs. something else in room init.
                room_items = []
            room = {"f": room_items, "w": 13, "id": msg[2]["rid"],
                    "l": 13, "lev": int(tmp[1]), "lvl": int(tmp[1]),
                    "tgs": [], "nm": tmp[0]}
            payload = {"rmmb": rmmb, "rm": room}
            owner_uid = msg[2]["uid"]
            if owner_uid in self.server.modules["ev"].events:
                event = await self.server.modules["ev"]._get_event(owner_uid)
                event_room = f"house_{owner_uid}_{event['l']}"
                if event_room == msg[0]:
                    # Only include evn when present — client §_-2jV§ tolerates
                    # missing keys; a packed null is worse than omission.
                    payload["evn"] = event
            # Compact diagnostic: proves what the client actually received.
            member0 = rmmb[0] if rmmb else {}
            logging.info(
                "h.r.info uid=%s rid=%s furn=%s members=%s "
                "m0keys=%s clths=%s apprnc_g=%s loc=%s",
                client.uid, msg[2].get("rid"),
                [i.get("tpid") for i in room_items],
                len(rmmb),
                sorted(member0.keys()) if isinstance(member0, dict) else None,
                (member0.get("clths") or {}).get("clths")
                if isinstance(member0, dict) else None,
                (member0.get("apprnc") or {}).get("g")
                if isinstance(member0, dict) else None,
                member0.get("locinfo") if isinstance(member0, dict) else None,
            )
            await client.send(["h.r.info", payload])
        elif subcommand == "rfr":
            redis = self.server.redis
            room = msg[0].split("_")[-1]
            room_data = await redis.lrange(f"rooms:{client.uid}:{room}", 0, -1)
            room_items = await self.server.get_room_items(client.uid, room)
            online = self.server.online
            if msg[0] not in self.server.rooms:
                return
            room_tmp = self.server.rooms[msg[0]].copy()
            for uid in room_tmp:
                try:
                    tmp = online[uid]
                except KeyError:
                    continue
                await tmp.send(["h.r.rfr", {"rm": {"f": room_items, "w": 13,
                                                   "l": 13,
                                                   "lev": int(room_data[1]),
                                                   "lvl": int(room_data[1]),
                                                   "tgs": [],
                                                   "nm": room_data[0]}}])
        elif subcommand == "kc":
            tmid = msg[2]["tmid"]
            owner = msg[0].split("_")[1]
            if owner != client.uid:
                return
            owner_data = await self.server.get_user_data(client.uid)
            user_data = await self.server.get_user_data(tmid)
            if user_data["role"] and not owner_data["role"]:
                return
            if owner not in self.kicked:
                self.kicked[owner] = {}
            self.kicked[owner][tmid] = time.time()
            room_tmp = self.server.rooms[msg[0]].copy()
            for uid in room_tmp:
                if uid not in self.server.online:
                    continue
                tmp = self.server.online[uid]
                if uid == tmid:
                    await tmp.send(["h.r.kc", {}])
                    await self.leave_room(tmp)
                await tmp.send([msg[0], tmid])
        else:
            await super().room(msg, client)

    async def _perform_login(self, client):
        await client.send(["cm.new", {"campaigns": const.campaigns}])
        await client.send(["cp.cht.gbl", {"blcklst": {"uids": []}}])
        await client.send(["nws.hasnews", {"gnexst": False, "gnunr": False}])

    async def _background(self):
        while True:
            for owner in self.kicked.copy():
                for uid in self.kicked[owner]:
                    if time.time() - self.kicked[owner][uid] >= 1800:
                        del self.kicked[owner][uid]
            await asyncio.sleep(60)
