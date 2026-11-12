"""Persistent achievement progress and trophy ownership helpers."""

import const


def _allowed_trophy(trophy_id, premium):
    if trophy_id in const.BLACKLIST_TROPHIES:
        return False
    if trophy_id in const.PREMIUM_TROPHIES and not premium:
        return False
    return True


async def get_owned_trophies(uid, server, premium=False):
    owned = await server.redis.smembers(f"uid:{uid}:trophies")
    achievement_trophies = {
        grade["awardId"]
        for descriptor in server.achievements.values()
        for grade in descriptor["grades"]
    }
    known_trophies = set(server.trophies) | achievement_trophies
    return {
        trophy_id for trophy_id in owned
        if trophy_id in known_trophies
        and _allowed_trophy(trophy_id, premium)
    }


async def build_collection(uid, server, premium=False):
    """Build the client achievement/trophy collection for one player."""
    redis = server.redis
    achievements = {}
    earned = set()

    for achievement_id, descriptor in server.achievements.items():
        progress = await redis.get(
            f"uid:{uid}:achievement:{achievement_id}:progress")
        progress = int(progress) if progress else 0
        level = 0
        next_win_count = 0
        for grade in descriptor["grades"]:
            if progress >= grade["winCount"]:
                level = grade["level"]
                earned.add(grade["awardId"])
            elif not next_win_count:
                next_win_count = grade["winCount"]
        achievements[achievement_id] = {
            "p": progress,
            "nWct": next_win_count,
            "l": level,
            "aId": achievement_id,
        }

    if earned:
        await redis.sadd(f"uid:{uid}:trophies", *earned)
    owned = await get_owned_trophies(uid, server, premium)
    selected = await redis.get(f"uid:{uid}:trid")
    if selected and selected not in owned:
        await redis.delete(f"uid:{uid}:trid")
    trophies = {
        trophy_id: {"trrt": 0, "trcd": 0, "trid": trophy_id}
        for trophy_id in owned
    }
    return {"ac": achievements, "tr": trophies}


async def add_progress(uid, server, achievement_id, amount=1):
    """Increment an implemented achievement and persist crossed trophies."""
    descriptor = server.achievements.get(achievement_id)
    if not descriptor or amount <= 0:
        return []
    redis = server.redis
    key = f"uid:{uid}:achievement:{achievement_id}:progress"
    old_progress = await redis.get(key)
    old_progress = int(old_progress) if old_progress else 0
    progress = await redis.incrby(key, int(amount))
    awarded = [
        grade["awardId"] for grade in descriptor["grades"]
        if old_progress < grade["winCount"] <= progress
    ]
    if awarded:
        await redis.sadd(f"uid:{uid}:trophies", *awarded)
    return awarded
