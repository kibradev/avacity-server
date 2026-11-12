#!/usr/bin/env python3
"""Seed a default avatar for a uid so create-avatar screen is skipped."""
import sys
import redis
import const

UID = sys.argv[1] if len(sys.argv) > 1 else "2"
GENDER = int(sys.argv[2]) if len(sys.argv) > 2 else 1  # 1=boy, 2=girl
NICK = sys.argv[3] if len(sys.argv) > 3 else f"Player{UID}"

r = redis.Redis(decode_responses=True)

# appearance list layout matches server.get_appearance / avatar.update_appearance
# n, nct, g, sc, ht, hc, brt, brc, et, ec, fft, fat, fac, ss, ssc, mt, mc,
# sh, shc, rg, rc, pt, pc, bt, bc
apprnc = [
    NICK,  # n
    0,     # nct
    GENDER,
    1,     # sc skin
    1,     # ht hair
    1,     # hc
    1,     # brt brows
    1,     # brc
    1,     # et eyes
    1,     # ec
    1,     # fft
    1,     # fat
    1,     # fac
    1,     # ss
    1,     # ssc
    1,     # mt mouth
    1,     # mc
    1,     # sh
    1,     # shc
    1,     # rg
    1,     # rc
    1,     # pt
    1,     # pc
    1,     # bt
    1,     # bc
]

r.delete(f"uid:{UID}:appearance")
r.rpush(f"uid:{UID}:appearance", *apprnc)

if GENDER == 1:
    weared = ["boyShoes8", "boyPants10", "boyShirt14"]
    available = ["boyUnderdress1"]
else:
    weared = ["girlShoes14", "girlPants9", "girlShirt12"]
    available = ["girlUnderdress1", "girlUnderdress2"]

r.set(f"uid:{UID}:wearing", "casual")
# clear old wearing/items lightly
for ctp in ("casual", "club", "official", "swimwear", "underdress"):
    r.delete(f"uid:{UID}:{ctp}")

for item in weared + available:
    r.sadd(f"uid:{UID}:items", item)
    r.delete(f"uid:{UID}:items:{item}")
    r.rpush(f"uid:{UID}:items:{item}", "cls", 1)

for item in weared:
    r.sadd(f"uid:{UID}:casual", item)

# starter furniture into livingroom + room1..5
for room in ["livingroom"] + [f"room{i}" for i in range(1, 6)]:
    for item in const.room_items:
        key = f"{item['tpid']}_{item['oid']}"
        r.sadd(f"rooms:{UID}:{room}:items", key)
        r.delete(f"rooms:{UID}:{room}:items:{key}")
        r.rpush(f"rooms:{UID}:{room}:items:{key}",
                item["x"], item["y"], item["z"], item["d"])
        if "rid" in item:
            r.sadd(f"rooms:{UID}:{room}:items:{key}:options", "rid")
            if item["rid"]:
                r.set(f"rooms:{UID}:{room}:items:{key}:rid", item["rid"])

# ensure basic economy keys exist
pipe = r.pipeline()
for k, v in (("slvr", 1000), ("gld", 50), ("enrg", 100), ("emd", 0),
             ("exp", 0), ("crt", 0), ("hrt", 0)):
    if not r.exists(f"uid:{UID}:{k}"):
        pipe.set(f"uid:{UID}:{k}", v)
pipe.execute()

print("seeded uid=", UID, "gender=", GENDER, "nick=", NICK)
print("appearance=", r.lrange(f"uid:{UID}:appearance", 0, -1))
print("casual=", r.smembers(f"uid:{UID}:casual"))
print("items=", r.smembers(f"uid:{UID}:items"))
