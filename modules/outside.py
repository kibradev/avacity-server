import logging

from modules.location import Location, gen_plr, get_cc
import const

class_name = "Outside"


class Outside(Location):
    prefix = "o"

    def __init__(self, server):
        super().__init__(server)
        self.commands.update({"r": self.room, "gr": self.get_room})

    async def disconnect(self, prefix, tmp, client):
        await tmp.send([prefix+".r.lv", {"uid": client.uid}])
        await tmp.send([client.room, client.uid], type_=17)

    async def connect(self, plr, tmp, client):
        await tmp.send(["o.r.jn", {"plr": plr}])
        await tmp.send([client.room, client.uid], type_=16)

    async def get_room(self, msg, client):
        logging.info("o.gr uid=%s zone=%s payload=%s",
                     client.uid, getattr(client, "zone", None), msg[2])
        if "rid" not in msg[2]:
            num = 1
            while True:
                room = f"{msg[2]['lid']}_{msg[2]['gid']}_{num}"
                if self._get_room_len(room) >= const.ROOM_LIMIT:
                    num += 1
                else:
                    break
        else:
            room = f"{msg[2]['lid']}_{msg[2]['gid']}_{msg[2]['rid']}"
        if client.room:
            await self.leave_room(client)
        await self.join_room(client, room)
        logging.info("o.gr ok uid=%s room=%s", client.uid, client.room)
        await client.send(["o.gr", {"rid": client.room}])

    async def room(self, msg, client):
        subcommand = msg[1].split(".")[2]
        if subcommand == "info":
            try:
                room = self.server.rooms[msg[0]].copy()
            except KeyError:
                logging.warning("o.r.info missing room uid=%s room=%s",
                                client.uid, msg[0])
                await client.send(["cp.ms.rsm", {"txt": "Произошла ошибка, "
                                                        "перезайдите в игру"}])
                return
            rmmb = []
            online = self.server.online
            location_name = msg[0].split("_")[0]
            cl = {"l": {"l1": [], "l2": []}}
            for uid in room:
                if uid not in online:
                    if uid in self.server.rooms[msg[0]]:
                        self.server.rooms[msg[0]].remove(uid)
                    continue
                plr = await gen_plr(online[uid], self.server)
                if plr:
                    rmmb.append(plr)
                if location_name == "canyon":
                    cl["l"][online[uid].canyon_lid].append(uid)
            payload = {"rmmb": rmmb}
            if location_name == "canyon":
                payload["cc"] = await get_cc(msg[0], self.server)
                payload["cl"] = cl
            room_parts = msg[0].split("_")
            if len(room_parts) >= 2:
                event_key = room_parts[1]
                if event_key in self.server.modules["ev"].events:
                    event = await self.server.modules["ev"]._get_event(
                        event_key)
                    event_room = f"{event['l']}_{event_key}"
                    if event_room == msg[0]:
                        payload["evn"] = event
            member0 = rmmb[0] if rmmb else {}
            logging.info(
                "o.r.info uid=%s room=%s members=%s m0keys=%s",
                client.uid, msg[0], len(rmmb),
                sorted(member0.keys()) if isinstance(member0, dict) else None,
            )
            await client.send(["o.r.info", payload])
        else:
            await super().room(msg, client)

    def _get_room_len(self, room):
        if room not in self.server.rooms:
            return 0
        return len(self.server.rooms[room])
