import time
from modules.base_module import Module

class_name = "ClanActivity"


class ClanActivity(Module):
    prefix = "ca"

    def __init__(self, server):
        self.server = server
        self.commands = {"gam": self.get_activity_members,
                         "gcart": self.get_activity_top}
        self.top = []
        self.update_time = 0
        self.updating = False

    async def get_activity_members(self, msg, client):
        cid = await self.server.redis.get(f"uid:{client.uid}:clan")
        if not cid:
            return
        global_act = await self._get_rating(cid)
        end_time = int(time.time())+(60*60*24*30)
        await client.send(["ca.gam", {"cam": {"cca": global_act,
                                              "ccpawdendtm": 0, "mcid": 1,
                                              "ccedt": end_time, "ccid": 2,
                                              "mced": end_time, "ccpawd": 0,
                                              "mca": global_act}}])

    async def get_activity_top(self, msg, client):
        await self._update_top()
        await client.send(["ca.gcart", {"cartuids": self.top, "carendtm": 0}])

    async def _get_rating(self, cid):
        members = await self.server.redis.smembers(f"clans:{cid}:m")
        global_act = 0
        for uid in members:
            act = await self.server.redis.get(f"uid:{uid}:act")
            if not act:
                continue
            global_act += int(act)
        return global_act

    async def _update_top(self):
        self.updating = True
        clans = await self.server.redis.smembers("clans")
        rating = []
        for cid in clans:
            tmp = await self._get_rating(cid)
            rating.append((int(cid), tmp))
        rating.sort(key=lambda value: (-value[1], value[0]))
        self.top = [cid for cid, _score in rating[:20]]
        self.update_time = time.time()
        self.updating = False
