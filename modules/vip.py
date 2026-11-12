import time
import const
import modules.notify as notify
from modules.base_module import Module

class_name = "Vip"


def _vip_duration():
    return getattr(const, "VIP_DURATION_DAYS", 30) * 86400


def _activation_gold():
    return getattr(const, "VIP_ACTIVATION_GOLD", 50)


class Vip(Module):
    prefix = "vp"

    def __init__(self, server):
        self.server = server
        self.commands = {
            "actvp": self.activate,
            "vpprdnd": self.period_ended,
            "bypnpl": self.buy_pinball,
            "awbypnpl": self.award_pinball,
            "sdtb": self.daily_points,
            "smdrn": self.send_drone,
        }

    async def get_vip_info(self, uid):
        r = self.server.redis
        end = await r.get(f"uid:{uid}:vip_end")
        end = int(end) if end else 0
        now = int(time.time())
        active = end == 0 or end > now
        trial_used = await r.get(f"uid:{uid}:vip_trial")
        level = await r.get(f"uid:{uid}:vip_level")
        level = int(level) if level else 0
        if not active:
            level = 0
        cpvpc = await r.get(f"uid:{uid}:vip_cp_points")
        ppvpc = await r.get(f"uid:{uid}:vip_pp_points")
        ttlvpc = await r.get(f"uid:{uid}:vip_total_points")
        return {
            "vpendtm": end if active else 0,
            "vplvl": level if active else 0,
            "cpvpc": int(cpvpc) if cpvpc else 0,
            "ppvpc": int(ppvpc) if ppvpc else 0,
            "ttlvpc": int(ttlvpc) if ttlvpc else 0,
            "vret": 0,
            "vfgc": 0,
            "vlfgpt": 0,
            "vfltc": 0,
            "vlfltpt": 0,
            "vpevract": bool(trial_used),
            "istexch": False,
            "isvdexch": False,
            "pnblplbght": bool(await r.get(f"uid:{uid}:vip_pinball_bought")),
            "pnblwn": bool(await r.get(f"uid:{uid}:vip_pinball_won")),
        }

    async def _sync_premium(self, uid, end_time):
        await self.server.redis.set(f"uid:{uid}:premium", end_time)

    async def _grant_vip(self, uid, extend=False):
        r = self.server.redis
        now = int(time.time())
        duration = _vip_duration()
        end = await r.get(f"uid:{uid}:vip_end")
        end = int(end) if end else 0
        if extend and end > now:
            end += duration
        else:
            end = now + duration
        level = await r.get(f"uid:{uid}:vip_level")
        level = int(level) if level else 0
        if level < 1:
            level = 1
        await r.set(f"uid:{uid}:vip_end", end)
        await r.set(f"uid:{uid}:vip_level", level)
        await r.set(f"uid:{uid}:vip_trial", 1)
        await self._sync_premium(uid, end)
        return end, level

    async def activate(self, msg, client):
        uid = client.uid
        r = self.server.redis
        trial_used = await r.get(f"uid:{uid}:vip_trial")
        user_data = await self.server.get_user_data(uid)
        if not trial_used:
            await self._grant_vip(uid)
        else:
            gold = _activation_gold()
            if user_data["gld"] < gold:
                await client.send(["cp.ms.rsm",
                                   {"txt": "Недостаточно золота для VIP"}])
                return
            await r.set(f"uid:{uid}:gld", user_data["gld"] - gold)
            await self._grant_vip(uid, extend=True)
            await notify.update_resources(client, self.server)
        starter = getattr(const, "VIP_STARTER_POINTS", 50)
        cpvpc = await r.get(f"uid:{uid}:vip_cp_points")
        cpvpc = int(cpvpc) if cpvpc else 0
        ttlvpc = await r.get(f"uid:{uid}:vip_total_points")
        ttlvpc = int(ttlvpc) if ttlvpc else 0
        await r.set(f"uid:{uid}:vip_cp_points", cpvpc + starter)
        await r.set(f"uid:{uid}:vip_total_points", ttlvpc + starter)
        await notify.update_vip_info(client, self.server)
        await client.send(["vp.vppadded", {"vpvprm": starter}])

    async def period_ended(self, msg, client):
        uid = client.uid
        r = self.server.redis
        await r.set(f"uid:{uid}:vip_level", 0)
        await r.delete(f"uid:{uid}:vip_end")
        await r.delete(f"uid:{uid}:premium")
        await notify.update_vip_info(client, self.server)

    async def buy_pinball(self, msg, client):
        silver = getattr(const, "VIP_PINBALL_SILVER", 100)
        user_data = await self.server.get_user_data(client.uid)
        if user_data["slvr"] < silver:
            return
        await self.server.redis.set(f"uid:{client.uid}:slvr",
                                    user_data["slvr"] - silver)
        await self.server.redis.set(f"uid:{client.uid}:vip_pinball_bought", 1)
        await notify.update_resources(client, self.server)
        tpid = msg[2].get("tpid", "")
        await client.send(["vp.bypnpl", {"tpid": tpid}])

    async def award_pinball(self, msg, client):
        gold = getattr(const, "VIP_PINBALL_GOLD", 1)
        user_data = await self.server.get_user_data(client.uid)
        await self.server.redis.set(f"uid:{client.uid}:gld",
                                    user_data["gld"] + gold)
        await self.server.redis.set(f"uid:{client.uid}:vip_pinball_won", 1)
        await notify.update_resources(client, self.server)
        await client.send(["vp.awbypnpl", {}])

    async def daily_points(self, msg, client):
        points = getattr(const, "VIP_DAILY_POINTS", 10)
        r = self.server.redis
        uid = client.uid
        cpvpc = await r.get(f"uid:{uid}:vip_cp_points")
        cpvpc = int(cpvpc) if cpvpc else 0
        ttlvpc = await r.get(f"uid:{uid}:vip_total_points")
        ttlvpc = int(ttlvpc) if ttlvpc else 0
        await r.set(f"uid:{uid}:vip_cp_points", cpvpc + points)
        await r.set(f"uid:{uid}:vip_total_points", ttlvpc + points)
        await notify.update_vip_info(client, self.server)
        await client.send(["vp.vppadded", {"vpvprm": points}])

    async def send_drone(self, msg, client):
        await client.send(["vp.smdrn", {}])
