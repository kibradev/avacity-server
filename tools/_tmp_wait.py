#!/usr/bin/env python3
import time
for _ in range(28):
    try:
        t = open("/tmp/server.log").read()
    except FileNotFoundError:
        t = ""
    if "New TCP connection" in t:
        break
    time.sleep(3)
time.sleep(3)
print(open("/tmp/server.log").read()[-3500:])
