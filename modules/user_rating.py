import asyncio
from modules.base_module import Module

class_name = "UserRating"


class UserRating(Module):
    prefix = "ur"

    def __init__(self, server):
        self.server = server
        self.commands = {"get": self.get, "gar": self.get_activity}
        self.top_act = []
        self.top_hrt = []

    async def get(self, msg, client):
        await self.update_hrt()
        await client.send(["ur.get", {"bt": self.top_hrt}])

    async def get_activity(self, msg, client):
        await self.update_act()
        await client.send(["ur.gar", {"bt": self.top_act}])

    async def _background(self):
        while True:
            await self.update_act()
            await self.update_hrt()
            await asyncio.sleep(600)

    async def update_act(self):
        users = []
        max_uid = int(await self.server.redis.get("uids") or 0)
        for i in range(1, max_uid+1):
            act = await self.server.redis.get(f"uid:{i}:act")
            if not await self.server.get_appearance(i):
                continue  # check for not created avatar
            users.append((i, int(act) if act else 0))
        users.sort(key=lambda value: (-value[1], value[0]))
        self.top_act = [uid for uid, _score in users[:10]]

    async def update_hrt(self):
        users = []
        max_uid = int(await self.server.redis.get("uids") or 0)
        for i in range(1, max_uid+1):
            hrt = await self.server.redis.get(f"uid:{i}:hrt")
            if not await self.server.get_appearance(i):
                continue  # check for not created avatar
            users.append((i, int(hrt) if hrt else 0))
        users.sort(key=lambda value: (-value[1], value[0]))
        best_top = []
        for uid, honor in users[:10]:
            cr = await self.server.redis.get(f"uid:{uid}:crt")
            best_top.append({"uid": uid, "hr": honor,
                             "cr": int(cr) if cr else 0})
        self.top_hrt = best_top
