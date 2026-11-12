#!/usr/bin/env python3
"""Re-seed clothes for existing uids to match pnz-city.swf initDefaultClothes."""
import sys
import redis

UIDS = sys.argv[1:] or ["2", "4", "5"]
r = redis.Redis(decode_responses=True)

BOY = ["boySMR14Sh3", "boyRshPnt", "boyTShrtHsk"]
GIRL = ["girlBtsPnd", "girlPntsPnd", "girlTShrtPnd"]
OLD = ["boyShoes8", "boyPants10", "boyShirt14", "boyUnderdress1",
       "girlShoes14", "girlPants9", "girlShirt12",
       "girlUnderdress1", "girlUnderdress2"]

for uid in UIDS:
    ap = r.lrange(f"uid:{uid}:appearance", 0, -1)
    if not ap:
        print(f"uid={uid} no appearance, skip")
        continue
    gender = int(ap[2])
    weared = BOY if gender == 1 else GIRL
    for ctp in ("casual", "club", "official", "swimwear", "underdress"):
        r.delete(f"uid:{uid}:{ctp}")
    # drop old starter clothes from inventory
    for item in OLD:
        r.srem(f"uid:{uid}:items", item)
        r.delete(f"uid:{uid}:items:{item}")
    r.set(f"uid:{uid}:wearing", "casual")
    for item in weared:
        r.sadd(f"uid:{uid}:items", item)
        r.delete(f"uid:{uid}:items:{item}")
        r.rpush(f"uid:{uid}:items:{item}", "cls", 1)
        r.sadd(f"uid:{uid}:casual", item)
    print(f"uid={uid} gender={gender} casual={r.smembers(f'uid:{uid}:casual')}")
