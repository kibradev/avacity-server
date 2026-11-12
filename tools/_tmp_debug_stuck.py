#!/usr/bin/env python3
import redis, os, json
r = redis.Redis(decode_responses=True)
uid = "2"
print("rooms set:", r.smembers(f"rooms:{uid}"))
for room in sorted(r.smembers(f"rooms:{uid}")):
    meta = r.lrange(f"rooms:{uid}:{room}", 0, -1)
    items = r.smembers(f"rooms:{uid}:{room}:items")
    print(f"ROOM {room} meta={meta} items={len(items)}")
    for it in sorted(items)[:20]:
        coords = r.lrange(f"rooms:{uid}:{room}:items:{it}", 0, -1)
        opts = r.smembers(f"rooms:{uid}:{room}:items:{it}:options")
        print(f"  {it} coords={coords} opts={opts}")

# check furniture files
for name in ["wall15", "floor4", "door4"]:
    paths = [
        f"/opt/avacity/base/files/swf/furniture/house/{name}.swf",
        f"/opt/avacity/base/files/swf/furniture/furniture/{name}.swf",
        f"/opt/avacity/base/files/swf/furniture/{name}.swf",
    ]
    for p in paths:
        print(name, p, "OK" if os.path.exists(p) else "MISSING")

# list house furniture dir sample
house = "/opt/avacity/base/files/swf/furniture/house"
if os.path.isdir(house):
    files = os.listdir(house)
    print("house furniture count", len(files))
    for f in sorted(files):
        if any(x in f.lower() for x in ["wall15", "floor4", "door4", "wall1", "floor1", "door1"]):
            print(" ", f)
else:
    print("NO house furniture dir")

# web log
for p in ["/tmp/web.log", "/tmp/server.log"]:
    if os.path.exists(p):
        data = open(p, "rb").read()[-2500:].decode("utf-8", "ignore")
        print("="*20, p, "="*20)
        print(data)
