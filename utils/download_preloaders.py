#!/usr/bin/env python3
"""Download Flash preloader SWFs that are not listed in versions.json."""
import os
import urllib.request

CDN = "http://cdn-sp.tortugasocial.com/avataria-ru/swf/preloader/"
OUT = os.path.join(os.path.dirname(__file__), "..", "files", "swf", "preloader")
FILES = [
    "DefaultPreloader.swf",
    "DogPreloader.swf",
    "ShoppingPreloader.swf",
    "ClubPreloader.swf",
    "MobilePreloader.swf",
    "PillowFightComix_ru.swf",
    "RomanceComix_ru.swf",
    "GirlsDressesComix_ru.swf",
]


def main() -> None:
    os.makedirs(OUT, exist_ok=True)
    for name in FILES:
        url = CDN + name
        dest = os.path.join(OUT, name)
        try:
            print(f"GET {url}")
            urllib.request.urlretrieve(url, dest)
            size = os.path.getsize(dest)
            print(f"  OK {name} ({size} bytes)")
        except Exception as exc:
            print(f"  FAIL {name}: {exc}")


if __name__ == "__main__":
    main()
