#!/usr/bin/env python3
"""Scale achievement winCount thresholds once and preserve XML layout."""
import re
from pathlib import Path
import sys


ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT))

import const


PATH = ROOT / "config_all_ru" / "modules" / "achievements.xml"
RU_LOCALE_PATH = ROOT / "config_all_ru" / "translation" / "achievements_ru.xml"


def _achievement_thresholds(text):
    result = {}
    for block in re.findall(r'<achievement\b.*?</achievement>', text,
                            flags=re.DOTALL):
        id_match = re.search(r'\bid="([^"]+)"', block)
        if not id_match:
            continue
        result[id_match.group(1)] = [
            (int(level), int(count))
            for level, count in re.findall(
                r'<grade\b[^>]*\blevel="(\d+)"[^>]*\bwinCount="(\d+)"',
                block,
            )
        ]
    return result


def scale_locale_threshold_text(path, achievements_text=None):
    """Update fixed Hint/Description numbers to match scaled thresholds."""
    path = Path(path)
    text = path.read_text(encoding="utf-8")
    marker = (f"<!-- achievement locale thresholds scaled "
              f"x{const.ACHIEVEMENT_THRESHOLD_MULTIPLIER} -->")
    if marker in text:
        return 0
    achievements_text = achievements_text or PATH.read_text(encoding="utf-8")
    thresholds = _achievement_thresholds(achievements_text)
    changed = 0
    multiplier = const.ACHIEVEMENT_THRESHOLD_MULTIPLIER
    for achievement_id, grades in thresholds.items():
        # Legacy school grades were 1/1/1 and were deliberately normalized
        # to 3/6/9. Its hints describe prize wins without fixed counters.
        if achievement_id == "schoolMaster":
            continue
        for level, scaled in grades:
            original = scaled // multiplier
            variants = {
                str(original),
                f"{original:,}".replace(",", " "),
                f"{original:,}".replace(",", "."),
                f"{original:,}".replace(",", "\u00a0"),
            }
            number_re = "(?:" + "|".join(
                re.escape(value) for value in sorted(variants, key=len,
                                                     reverse=True)
            ) + ")"
            for suffix in ("Hint", "Description"):
                key = re.escape(f"{achievement_id}{suffix}{level}")
                message_re = re.compile(
                    rf'(<message\s+key="{key}">)(.*?)(</message>)',
                    flags=re.DOTALL,
                )

                def replace_message(match):
                    nonlocal changed
                    body, count = re.subn(
                        rf'(?<!\d){number_re}(?!\d)',
                        f"{scaled:,}".replace(",", "."),
                        match.group(2),
                        count=1,
                    )
                    if count:
                        changed += 1
                    return match.group(1) + body + match.group(3)

                text = message_re.sub(replace_message, text, count=1)
    text = text.replace(
        re.search(r'<locale\b[^>]*>', text).group(0),
        re.search(r'<locale\b[^>]*>', text).group(0) + "\n        " + marker,
        1,
    )
    path.write_text(text, encoding="utf-8")
    return changed


def main():
    multiplier = const.ACHIEVEMENT_THRESHOLD_MULTIPLIER
    text = PATH.read_text(encoding="utf-8")
    marker_re = re.compile(r"<!-- achievement thresholds scaled x(\d+) -->")
    marker = marker_re.search(text)
    if marker:
        if int(marker.group(1)) != multiplier:
            raise SystemExit(
                f"thresholds already scaled x{marker.group(1)}; "
                f"refusing to apply x{multiplier} again"
            )
        print(f"achievement thresholds already scaled x{multiplier}")
        count = 0
    else:
        count = 0

        def scale_achievement(match):
            nonlocal count
            previous = 0

            def scale_grade(grade_match):
                nonlocal count, previous
                scaled = int(grade_match.group(1)) * multiplier
                # Some legacy grades share a threshold. Keep every level
                # earnable separately instead of awarding all at once.
                if scaled <= previous:
                    scaled = previous + multiplier
                previous = scaled
                count += 1
                return f'winCount="{scaled}"'

            return re.sub(r'winCount="(\d+)"', scale_grade, match.group(0))

        text = re.sub(
            r'<achievement\b.*?</achievement>',
            scale_achievement,
            text,
            flags=re.DOTALL,
        )
        text = text.replace(
            "<config>",
            f"<config>\n    <!-- achievement thresholds scaled x{multiplier} -->",
            1,
        )
        PATH.write_text(text, encoding="utf-8")
        print(f"scaled {count} achievement thresholds x{multiplier}")
    locale_count = scale_locale_threshold_text(RU_LOCALE_PATH, text)
    print(f"updated {locale_count} RU achievement hint/description values")


if __name__ == "__main__":
    main()
