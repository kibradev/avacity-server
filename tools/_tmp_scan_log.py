#!/usr/bin/env python3
import re
with open("/tmp/server.log") as f:
    text = f.read()
for pat in ("Traceback", "Error", "Exception", "Ошибка", "WARNING", "CRITICAL", "minfo", "not found"):
    hits = [ln for ln in text.splitlines() if pat in ln]
    print(f"=== {pat} ({len(hits)}) ===")
    for ln in hits[-15:]:
        print(ln)
