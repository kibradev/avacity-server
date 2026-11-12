from modules.base_module import Module
from modules.location import refresh_avatar

icon = "https://ava.city/files/"
class_name = "Support"


class Support(Module):
    prefix = "spt"

    def __init__(self, server):
        self.server = server
        self.commands = {"init": self.init, "gscnl": self.get_social_channels,
                         "rsnm": self.reset_avatar_name,
                         "lmdac": self.load_moderator_actions,
                         "swcr": self.show_crown, "clev": self.close_event,
                         "swlc": self.switch_location}

    async def init(self, msg, client):
        user_data = await self.server.get_user_data(client.uid)
        await client.send(["spt.init", {"a": bool(user_data and
                                                   user_data["role"] >= 1)}])

    async def get_social_channels(self, msg, client):
        channels = []
        channels.append({"act": True, "prt": 1, "id": 1, "stid": "rules",
                         "dsctn": "Правила сервера",
                         "ttl": "Правила", "icnurl": icon+"rules.png",
                         "lnk": ""})
        channels.append({"act": True, "prt": 2, "id": 2, "stid": "tg",
                         "dsctn": "Группа Telegram",
                         "ttl": "Telegram", "icnurl": icon+"tg.png?1",
                         "lnk": "https://t.me/avacity_2_0"})
        channels.append({"act": True, "prt": 3, "id": 3, "stid": "rules",
                         "dsctn": "", "ttl": "Техподдержка",
                         "icnurl": icon+"support.png",
                         "lnk": "https://t.me/avacity_help"})
        channels.append({"act": True, "prt": 4, "id": 4, "stid": "faq",
                         "dsctn": "Подробный гайд по игре", "ttl": "FAQ",
                         "icnurl": icon+"faq.png",
                         "lnk": "https://medium.com/@support_a.c/"
                                "ava-city-faq-гайд-для-новичков-914414d1fe2e"})
        await client.send(["spt.gscnl", {"scls": channels}])

    async def reset_avatar_name(self, msg, client):
        component = self.server.modules["cp"]
        uid = str(msg[2]["uid"])
        if not await component.can_moderate(client, uid, "RENAME_AVATAR"):
            return await component.no_permission(client)
        name = msg[2]["n"].strip()
        if not name or len(name) > 20:
            return
        if not await self.server.redis.lindex(f"uid:{uid}:appearance", 0):
            return
        await self.server.redis.lset(f"uid:{uid}:appearance", 0, name)
        if uid in self.server.online:
            tmp = self.server.online[uid]
            await refresh_avatar(tmp, self.server)
        await component.record_moderator_action(
            uid, client.uid, "rename", name)

    async def load_moderator_actions(self, msg, client):
        component = self.server.modules["cp"]
        uid = str(msg[2]["uid"])
        if await component.has_privilege(client.uid, "USER_ACTIONS_HISTORY"):
            actions = await component.get_moderator_actions(uid)
        else:
            actions = []
        # Always answer: the client keeps a callback pending until this reply.
        await client.send(["spt.lmdac", {"uid": uid, "acts": actions}])

    async def show_crown(self, msg, client):
        component = self.server.modules["cp"]
        if not await component.has_privilege(client.uid,
                                             "ABILITY_HIDE_LETTER"):
            return await component.no_permission(client)
        redis = self.server.redis
        crown = await redis.get(f"uid:{client.uid}:hide_crown")
        if not crown:
            await redis.set(f"uid:{client.uid}:hide_crown", 1)
        else:
            await redis.delete(f"uid:{client.uid}:hide_crown")
        await refresh_avatar(client, self.server)

    async def close_event(self, msg, client):
        privileges = self.server.modules["cp"].privileges
        user_data = await self.server.get_user_data(client.uid)
        if user_data["role"] < privileges["EVENT_BAN"]:
            return
        events = self.server.modules["ev"].events
        eid = str(msg[2]["eid"])
        if eid not in events:
            return
        del events[eid]
        msg.pop(0)
        await client.send(msg)

    async def switch_location(self, msg, client):
        component = self.server.modules["cp"]
        if not await component.has_privilege(client.uid,
                                             "FIND_ITSELF_BAN"):
            return await component.no_permission(client)
        if await self.server.redis.get(f"uid:{client.uid}:loc_disabled"):
            await self.server.redis.delete(f"uid:{client.uid}:loc_disabled")
        else:
            await self.server.redis.set(f"uid:{client.uid}:loc_disabled", 1)
        await refresh_avatar(client, self.server)
