from modules.base_module import Module
from modules.location import get_city_info
from modules.achievements import build_collection, get_owned_trophies
import const

class_name = "Passport"


class Passport(Module):
    prefix = "psp"

    def __init__(self, server):
        self.server = server
        self.commands = {"sttrph": self.set_trophy, "psp": self.passport,
                         "stpsrtdcr": self.set_pass_decor}

    async def set_trophy(self, msg, client):
        requested = msg[2].get("trid")
        user_data = await self.server.get_user_data(client.uid)
        owned = await get_owned_trophies(
            client.uid, self.server, user_data["premium"])
        if requested not in owned:
            await self.server.redis.delete(f"uid:{client.uid}:trid")
            trid = None
        else:
            trid = requested
            await self.server.redis.set(f"uid:{client.uid}:trid", trid)
        await client.send(["psp.sttrph", {"trid": trid}])
        ci = await get_city_info(client.uid, self.server)
        await client.send(["ntf.ci", {"ci": ci}])

    async def passport(self, msg, client):
        user_data = await self.server.get_user_data(msg[2]["uid"])
        ach = await build_collection(
            msg[2]["uid"], self.server, user_data["premium"])
        rel = {}
        rl = self.server.modules["rl"]
        r = self.server.redis
        relations = await r.smembers(f"rl:{msg[2]['uid']}")
        for link in relations:
            relation = await rl._get_relation(msg[2]["uid"], link)
            if not relation:
                continue
            if relation["rlt"]["s"] // 10 in [6, 7]:
                uid = relation["uid"]
                rel[uid] = relation["rlt"]
        await client.send(["psp.psp", {"psp": {"uid": msg[2]["uid"],
                                               "ach": ach,
                                               "rel": rel}}])

    async def set_pass_decor(self, msg, client):
        psrtdcr = msg[2]["psrtdcr"]
        await self.server.redis.set(f"uid:{client.uid}:psrtdcr", psrtdcr)
        await client.send(["psp.stpsrtdcr", {"psrtdcr": psrtdcr}])
        ci = await get_city_info(client.uid, self.server)
        await client.send(["ntf.ci", {"ci": ci}])
