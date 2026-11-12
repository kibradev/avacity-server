#!/usr/bin/env python3
"""Set every client-visible quest task skip price from its quest reward."""
import re
from pathlib import Path
import sys


ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT))

from xml_parser import calculate_quest_skip_price


QUESTS = ROOT / "config_all_ru" / "modules" / "quests.xml"
QUEST_RE = re.compile(r"<quest\b[\s\S]*?</quest>")
AWARD_RE = re.compile(r"<award>[\s\S]*?</award>")
TASK_RE = re.compile(r"<task\b[^>]*>")


def award_amount(block, name):
    match = re.search(rf"<{name}>(\d+)</{name}>", block)
    return int(match.group(1)) if match else 0


def price_quest(block):
    task_count = len(TASK_RE.findall(block))
    if not task_count:
        return block, 0
    award_match = AWARD_RE.search(block)
    award_block = award_match.group(0) if award_match else ""
    award = {
        "gold": award_amount(award_block, "gold"),
        "silver": award_amount(award_block, "silver"),
    }
    price = calculate_quest_skip_price(award, task_count)

    def replace_task(match):
        tag = match.group(0)
        if re.search(r'\bgold="\d+"', tag):
            return re.sub(r'\bgold="\d+"', f'gold="{price}"', tag, count=1)
        return tag.replace("<task", f'<task gold="{price}"', 1)

    return TASK_RE.sub(replace_task, block), task_count


def main():
    text = QUESTS.read_text(encoding="utf-8")
    changed_tasks = 0

    def replace_quest(match):
        nonlocal changed_tasks
        priced, count = price_quest(match.group(0))
        changed_tasks += count
        return priced

    priced = QUEST_RE.sub(replace_quest, text)
    QUESTS.write_text(priced, encoding="utf-8")
    print(f"priced {changed_tasks} quest tasks in {QUESTS}")


if __name__ == "__main__":
    main()
