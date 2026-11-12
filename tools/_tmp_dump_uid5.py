#!/usr/bin/env python3
import redis, traceback, sys
out = open("/tmp/uid_dump.txt", "w")
try:
    r = redis.Redis(decode_responses=True)
    for uid in ("2", "4", "5"):
        out.write(f"===== uid={uid} =====\n")
        out.write(f"appearance {r.lrange(f'uid:{uid}:appearance',0,-1)}\n")
        out.write(f"wearing {r.get(f'uid:{uid}:wearing')}\n")
        out.write(f"casual {r.smembers(f'uid:{uid}:casual')}\n")
        out.write(f"items {r.smembers(f'uid:{uid}:items')}\n")
        out.write(f"rooms {r.smembers(f'rooms:{uid}')}\n")
        out.write(f"livingroom meta {r.lrange(f'rooms:{uid}:livingroom',0,-1)}\n")
        items = r.smembers(f"rooms:{uid}:livingroom:items") or set()
        out.write(f"livingroom items {items}\n")
        for it in sorted(items):
            out.write(f"  {it} {r.lrange(f'rooms:{uid}:livingroom:items:{it}',0,-1)} "
                      f"opts={r.smembers(f'rooms:{uid}:livingroom:items:{it}:options')} "
                      f"rid={r.get(f'rooms:{uid}:livingroom:items:{it}:rid')}\n")
    out.write("OK\n")
except Exception:
    out.write(traceback.format_exc())
out.close()
print("wrote /tmp/uid_dump.txt")
