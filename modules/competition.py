import asyncio

from modules.base_module import Module
from modules.leaderboard import add_competition_score

class_name = "Competition"


# IDs are defined by the client's CompetitionType model.  Keeping the storage
# key here makes every configured leaderboard deterministic and persistent.
COMPETITIONS = {
    "snowboardRating": {"type": 2, "key": "snowscore", "limit": 10},
    "hockeyRating": {"type": 8, "key": "hockeyscore", "limit": 10},
    "singleDancers": {"type": 9, "key": "dancescore", "limit": 50},
    "duelDancers": {"type": 10, "key": "dancewins", "limit": 50},
}
COMPETITIONS_BY_TYPE = {
    definition["type"]: (name, definition)
    for name, definition in COMPETITIONS.items()
}


class Competition(Module):
    prefix = "ctmr"

    def __init__(self, server):
        self.server = server
        self.commands = {
            "get": self.get_top,
            "gwn": self.get_winners,
            "adrt": self.add_rating,
        }
        self.tops = {name: [] for name in COMPETITIONS}
        # Kept for compatibility with code which used the old snow-only cache.
        self.top = []
        self._last_submission = {}

    async def _background(self):
        while True:
            await self.update_all()
            await asyncio.sleep(600)

    async def _user_scores(self, score_key, limit):
        max_uid = int(await self.server.redis.get("uids") or 0)
        scores = []
        for uid in range(1, max_uid + 1):
            if not await self.server.get_appearance(uid):
                continue
            score = int(await self.server.redis.get(
                f"uid:{uid}:{score_key}") or 0)
            scores.append((uid, score))
        scores.sort(key=lambda value: (-value[1], value[0]))
        return scores[:limit]

    async def update_all(self):
        for name, definition in COMPETITIONS.items():
            scores = await self._user_scores(definition["key"],
                                             definition["limit"])
            self.tops[name] = scores
        self.top = [uid for uid, _score in self.tops["snowboardRating"]]

    async def update_snow(self):
        scores = await self._user_scores("snowscore", 10)
        self.tops["snowboardRating"] = scores
        self.top = [uid for uid, _score in scores]

    async def get_top(self, msg, client):
        await self.update_all()
        result = {
            name: [uid for uid, _score in self.tops[name]]
            for name in COMPETITIONS
        }
        await client.send(["ctmr.get", {"tu": result}])

    async def get_winners(self, msg, client):
        try:
            competition_type = int(msg[2].get("ctp", 2))
        except (TypeError, ValueError):
            competition_type = -1
        entry = COMPETITIONS_BY_TYPE.get(competition_type)
        if entry is None:
            await client.send(["ctmr.gwn", {
                "ctp": competition_type, "tu": [],
            }])
            return
        name, _definition = entry
        await self.update_all()
        winners = [{
            "uid": uid,
            "cr": score,
            "ct": competition_type,
            "cid": 1,
        } for uid, score in self.tops[name]]
        await client.send(["ctmr.gwn", {
            "ctp": competition_type, "tu": winners,
        }])

    async def record_score(self, uid, competition_type, points):
        entry = COMPETITIONS_BY_TYPE.get(int(competition_type))
        if entry is None:
            return None
        _name, definition = entry
        return await add_competition_score(
            self.server, uid, definition["key"], points)

    async def add_rating(self, msg, client):
        """Accept a completed minigame score using the client's native wire API.

        The small cooldown prevents a modified client from flooding this route;
        game-specific server handlers should call record_score directly.
        """
        payload = msg[2]
        try:
            competition_type = int(payload.get("ctp", -1))
        except (TypeError, ValueError):
            return
        try:
            points = max(0, min(10000, int(payload.get("crt", 0))))
        except (TypeError, ValueError):
            points = 0
        now = asyncio.get_running_loop().time()
        cooldown_key = (client.uid, competition_type)
        if now - self._last_submission.get(cooldown_key, 0) < 5:
            return
        self._last_submission[cooldown_key] = now
        total = await self.record_score(client.uid, competition_type, points)
        if total is None:
            return
        await client.send(["ctmr.adrt", {
            "ctp": competition_type, "crt": total,
        }])
