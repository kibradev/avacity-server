#!/usr/bin/env python3
import os
import sys


BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, BASE)
os.chdir(BASE)

import const  # noqa: E402


campaign = next(item for item in const.campaigns if item["id"] == 9001)
sections = {item["tid"]: item["si"] for item in campaign["cil"]}
assert sections["vip2"] == 0
assert sections["pinballSilverPrice"] == const.VIP_PINBALL_SILVER
assert sections["pinballWinGold"] == const.VIP_PINBALL_GOLD
assert len({item["id"] for item in campaign["cil"]}) == len(campaign["cil"])
print("campaign 9001: OK")
