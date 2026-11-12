#!/usr/bin/env python3
import pathlib, re
root = pathlib.Path("/opt/avacity/base/files/pnz-exported/scripts")
needles = [
    "serverConnectionError",
    "serverConnection",
    "ConnectionError",
    "onConnectError",
    "AGSConnectEvent",
]
for p in root.rglob("*.as"):
    t = p.read_text(errors="ignore")
    hits = [n for n in needles if n in t]
    if not hits:
        continue
    if hits == ["AGSConnectEvent"]:
        # only interesting if also shows dialog
        if "B5P" not in t and "AlJ" not in t and "serverBusy" not in t and "onConnectError" not in t:
            continue
    print("FILE", p.relative_to(root), "hits", hits)
    for i, line in enumerate(t.splitlines(), 1):
        if any(n in line for n in needles + ["B5P", "serverBusy", "AlJ"]):
            if "AGSConnectEvent" in line and "import" in line:
                continue
            print(f"  {i}: {line.strip()[:160]}")
