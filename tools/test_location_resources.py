#!/usr/bin/env python3
import os
import re
import sys


BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, BASE)
os.chdir(BASE)

from modules.descriptor import outsideLocations  # noqa: E402


missing = []
for location in outsideLocations:
    libraries = set(location["ldc"].split(","))
    for room in location["rms"]:
        map_path = os.path.join("config_all_ru", "map", room["uc"] + ".xml")
        if not os.path.exists(map_path):
            continue
        with open(map_path, encoding="utf-8") as map_file:
            required = set(re.findall(r"@([A-Za-z0-9_]+)", map_file.read()))
        absent = required - libraries
        if absent:
            missing.append((location["id"], room["id"], sorted(absent)))

assert not missing, f"location preload libraries missing: {missing}"
print("location resource preloads: OK")
