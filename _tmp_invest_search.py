import re, zipfile, os
from pathlib import Path

keys = [
    "quest1Task1Title",
    "quest2Task1Title",
    "quest158Task2Title",
    "quest125Task1Title",
]

base = Path("/opt/avacity/base")
print("=== rg-like search in repo files (text) ===")
# walk excluding venv, ffdec, __pycache__, large binaries
skip_dirs = {".git", "venv", "__pycache__", "ffdec", "node_modules"}
hits = {k: [] for k in keys}
for root, dirs, files in os.walk(base):
    dirs[:] = [d for d in dirs if d not in skip_dirs and not d.startswith(".")]
    for fn in files:
        if fn.endswith((".zip", ".jar", ".png", ".jpg", ".pyc", ".so", ".exe", ".swf", ".ico")):
            continue
        path = Path(root) / fn
        try:
            if path.stat().st_size > 20_000_000:
                continue
            text = path.read_text(encoding="utf-8", errors="ignore")
        except Exception:
            continue
        for k in keys:
            if k in text:
                # find nearby context lines
                for i, line in enumerate(text.splitlines()):
                    if k in line:
                        hits[k].append(f"{path}:{i+1}:{line.strip()[:200]}")
                        break

for k in keys:
    print(f"\n-- {k} ({len(hits[k])} files) --")
    for h in hits[k][:15]:
        print(" ", h)

print("\n=== Search inside zip archives in files/data ===")
data = base / "files/data"
for zp in sorted(data.glob("config_all_*.zip")):
    try:
        with zipfile.ZipFile(zp) as z:
            for name in z.namelist():
                if not name.endswith((".xml", ".json", ".txt", ".csv", ".as", ".py", ".md")):
                    continue
                try:
                    raw = z.read(name).decode("utf-8", errors="ignore")
                except Exception:
                    continue
                for k in keys:
                    if k in raw:
                        # extract message if present
                        m = re.search(rf'<message\s+key="{re.escape(k)}"[^>]*>(.*?)</message>', raw, re.S)
                        if m:
                            print(f"  HIT message {k} in {zp.name}:{name} => {m.group(1).strip()[:120]}")
                        else:
                            # line context
                            for line in raw.splitlines():
                                if k in line:
                                    print(f"  HIT {k} in {zp.name}:{name} :: {line.strip()[:160]}")
                                    break
    except Exception as e:
        print("ERR", zp, e)
