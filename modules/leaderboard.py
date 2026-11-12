"""Shared persistent scoring helpers for player leaderboards."""


async def add_activity(server, uid, points=1):
    points = max(0, int(points))
    if not points:
        return 0
    return await server.redis.incrby(f"uid:{uid}:act", points)


async def add_competition_score(server, uid, score_key, points):
    points = max(0, int(points))
    if not points:
        current = await server.redis.get(f"uid:{uid}:{score_key}")
        return int(current) if current else 0
    return await server.redis.incrby(f"uid:{uid}:{score_key}", points)
