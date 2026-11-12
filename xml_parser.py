from lxml import etree
from pathlib import Path

from const import (QUEST_SKIP_MIN_GOLD, QUEST_SKIP_REWARD_PERCENT,
                   QUEST_SKIP_SILVER_PER_GOLD)


def calculate_quest_skip_price(award, task_count):
    """Return one task's skip price from the quest's monetary reward.

    Skipping every task costs QUEST_SKIP_REWARD_PERCENT percent of the
    quest's gold-equivalent reward. Quests without a monetary reward still
    cost the configured minimum, so the client never offers a free skip.
    """
    if task_count <= 0:
        return QUEST_SKIP_MIN_GOLD
    reward_units = (
        award.get("gold", 0) * QUEST_SKIP_SILVER_PER_GOLD
        + award.get("silver", 0)
    )
    divisor = QUEST_SKIP_SILVER_PER_GOLD * task_count * 100
    price = (
        reward_units * QUEST_SKIP_REWARD_PERCENT + divisor - 1
    ) // divisor
    return max(QUEST_SKIP_MIN_GOLD, price)


class Parser():
    def __init__(self):
        self.parser = etree.XMLParser(remove_comments=True)
        self.apprnc_map = ["sc", "et", "brt", "at", "ht", "bt", "sh", "rg",
                           "ss", "pt", "fat", "fft"]

    def parse_clothes(self):
        clothes = {"boy": {}, "girl": {}}
        for filename in ["boyClothes.xml", "girlClothes.xml"]:
            if filename == "boyClothes.xml":
                gender = "boy"
            else:
                gender = "girl"
            doc = etree.parse("config_all_ru/inventory/"+filename,
                              parser=self.parser)
            root = doc.getroot()
            for category in root.findall(".//category[@logCategory2]"):
                name = gender+category.attrib["logCategory2"][1:]
                clothes[gender][name] = self.parse_clothes_category(category)
        return clothes

    def parse_clothes_category(self, category):
        tmp = {}
        for item in category:
            if item.tag == "category":
                tmp.update(self.parse_clothes_category(item))
                continue
            name = item.attrib["id"]
            tmp[name] = {}
            for attr in ["gold", "rating", "silver"]:
                if attr in item.attrib:
                    tmp[name][attr] = int(item.attrib[attr])
                else:
                    tmp[name][attr] = 0
            for attr in ["canBuy", "vipOnly"]:
                if attr in item.attrib:
                    tmp[name][attr] = bool(int(item.attrib[attr]))
                else:
                    if attr == "canBuy":
                        tmp[name][attr] = True
                    else:
                        tmp[name][attr] = False
        return tmp

    def parse_cloth_sets(self):
        doc = etree.parse("config_all_ru/inventory/extend/clothesSets.xml",
                          parser=self.parser)
        root = doc.getroot()
        sets = {"boy": {}, "girl": {}}
        for set_ in root.findall(".//clothesSet"):
            id_ = set_.attrib["id"]
            gender = set_.attrib["gender"]
            sets[gender][id_] = []
            for item in set_.findall("item"):
                sets[gender][id_].append(item.attrib["itemId"])
        return sets

    def parse_furniture(self):
        furniture = {}
        for filename in ["furniture.xml", "kitchen.xml", "bathroom.xml",
                         "decor.xml", "present.xml", "roomLayout.xml",
                         "clanFurniture.xml"]:
            doc = etree.parse(f"config_all_ru/inventory/{filename}",
                              parser=self.parser)
            root = doc.getroot()
            for item in root.findall(".//item"):
                name = item.attrib["id"]
                furniture[name] = {}
                for attr in ["gold", "rating", "silver"]:
                    if attr in item.attrib:
                        furniture[name][attr] = int(item.attrib[attr])
                    else:
                        furniture[name][attr] = 0
        return furniture

    def parse_conflicts(self):
        doc = etree.parse("config_all_ru/inventory/extend/clothesRules.xml",
                          parser=self.parser)
        root = doc.getroot()
        conflicts = []
        for rule in root.findall(".//rule"):
            conflicts.append([rule.attrib["category1"],
                              rule.attrib["category2"]])
        return conflicts

    def parse_privileges(self):
        doc = etree.parse("config_all_ru/modules/acl.xml", parser=self.parser)
        root = doc.getroot()
        privileges = {}
        for item in root.findall(".//privilege"):
            privileges[item.attrib["name"]] = int(item.attrib["minAuthority"])
        return privileges

    def parse_game_items(self):
        doc = etree.parse("config_all_ru/inventory/game.xml",
                          parser=self.parser)
        root = doc.getroot()
        items = {}
        for category in root.findall(".//category"):
            cat_name = category.attrib["id"]
            items[cat_name] = {}
            for item in category.findall(".//item"):
                name = item.attrib["id"]
                items[cat_name][name] = {}
                for attr in ["gold", "silver", "saleSilver"]:
                    if attr in item.attrib:
                        items[cat_name][name][attr] = int(item.attrib[attr])
                    else:
                        if attr == "saleSilver":
                            continue
                        items[cat_name][name][attr] = 0
                for attr in ["canBuy"]:
                    if attr in item.attrib:
                        items[cat_name][name][attr] = bool(int(item.attrib[attr]))
                    else:
                        if attr == "canBuy":
                            items[cat_name][name][attr] = True
                        else:
                            items[cat_name][name][attr] = False
        return items

    def parse_gift_boxes(self):
        """Index the game's native gift pools by the box item id."""
        gifts = {}
        gift_dir = Path("config_all_ru/modules/gifts")
        for filename in sorted(gift_dir.glob("*.xml")):
            doc = etree.parse(str(filename), parser=self.parser)
            root = doc.getroot()
            group = root.find(".//group")
            if group is None:
                continue
            group_id = group.attrib.get("id", filename.stem)
            for category in group.findall(".//category"):
                type_ids = category.attrib.get("typeIds", "")
                for gift_id in (value.strip() for value in
                                type_ids.split(",")):
                    if not gift_id:
                        continue
                    gift = gifts.setdefault(gift_id, {
                        "group": group_id,
                        "categories": [],
                    })
                    items = []
                    for item in category.findall("item"):
                        items.append({
                            "id": item.attrib["typeId"],
                            "min": int(item.attrib.get("minCount", 1)),
                            "max": int(item.attrib.get("maxCount", 1)),
                            "probability": float(
                                item.attrib.get("probability", 1)),
                            "gender": item.attrib.get("gender"),
                        })
                    if items:
                        gift["categories"].append({
                            "id": category.attrib.get("id", "loot"),
                            "items": items,
                        })
        return gifts

    def parse_achievements(self):
        doc = etree.parse("config_all_ru/modules/achievements.xml",
                          parser=self.parser)
        root = doc.getroot()
        ac = {}
        for item in root.findall(".//achievement"):
            grades = []
            for grade in item.findall("grade"):
                grades.append({
                    "level": int(grade.attrib["level"]),
                    "winCount": int(grade.attrib["winCount"]),
                    "awardId": grade.attrib["awardId"],
                })
            grades.sort(key=lambda value: value["level"])
            ac[item.attrib["id"]] = {
                "maxlevel": int(item.attrib.get("maxlevel", len(grades))),
                "grades": grades,
            }
        return ac

    def parse_trophies(self):
        doc = etree.parse("config_all_ru/modules/trophies.xml",
                          parser=self.parser)
        root = doc.getroot()
        tr = []
        for item in root.findall(".//trophy"):
            # if item.attrib["id"] in ["newYear2020hero", "mittens2020"]:
            #    continue
            tr.append(item.attrib["id"])
        return tr

    def parse_craft(self):
        doc = etree.parse("config_all_ru/modules/craft.xml",
                          parser=self.parser)
        root = doc.getroot()
        items = {}
        for item in root.findall(".//craftedItem"):
            id_ = item.attrib["itemId"]
            items[id_] = {"items": {}}
            if "craftedId" in item.attrib:
                items[id_]["craftedId"] = item.attrib["craftedId"]
                items[id_]["count"] = int(item.attrib["count"])
            for tmp in item.findall("component"):
                itemId = tmp.attrib["itemId"]
                count = int(tmp.attrib["count"])
                items[id_]["items"][itemId] = count
        return items

    def parse_appearance(self):
        doc = etree.parse("config_all_ru/avatarAppearance/appearance.xml",
                          parser=self.parser)
        root = doc.getroot()
        apprnc = {"boy": {}, "girl": {}}
        for gender in ["boy", "girl"]:
            el = root.find(gender)
            for category in el.findall("category"):
                id_ = int(category.attrib["id"])
                map_ = self.apprnc_map[id_]
                apprnc[gender][map_] = {}
                for item in category.findall("item"):
                    try:
                        kind = int(item.attrib["kind"])
                    except ValueError:
                        continue
                    apprnc[gender][map_][kind] = {}
                    for attr in ["silver", "gold", "brush", "visagistLevel"]:
                        if attr in item.attrib:
                            value = int(item.attrib[attr])
                            apprnc[gender][map_][kind][attr] = value
                    for attr in ["salonOnly"]:
                        if attr in item.attrib:
                            apprnc[gender][map_][kind][attr] = True
        return apprnc

    def parse_relations(self):
        doc = etree.parse("config_all_ru/modules/relations.xml",
                          parser=self.parser)
        root = doc.getroot()
        statuses = {}
        tmp = root.find(".//statuses")
        for status in tmp.findall("status"):
            id_ = int(status.attrib["id"])
            statuses[id_] = {"transition": [], "progress": {}}
            for progress in status.findall("progress"):
                value = int(progress.attrib["value"])
                tmp_status = int(progress.attrib["status"])
                statuses[id_]["progress"][value] = tmp_status
            for trans in status.findall("statusForTransition"):
                tmp_id = int(trans.attrib["id"])
                statuses[id_]["transition"].append(tmp_id)
        return statuses

    def parse_relation_progresses(self):
        doc = etree.parse("config_all_ru/modules/relations.xml")
        root = doc.getroot()
        progresses = {}
        tmp = root.find(".//progresses")
        for progress in tmp.findall("progress"):
            value = int(progress.attrib["value"])
            progresses[progress.attrib["reason"]] = value
        return progresses

    def parse_quests(self):
        doc = etree.parse("config_all_ru/modules/quests.xml",
                          parser=self.parser)
        root = doc.getroot()
        quests = {}
        for q in root.findall("quest"):
            qid = q.attrib["id"]
            award = {}
            award_el = q.find("award")
            if award_el is not None:
                for tag in ["exp", "energy", "gold", "silver"]:
                    tag_el = award_el.find(tag)
                    if tag_el is not None and tag_el.text:
                        award[tag] = int(tag_el.text)
                award["items"] = [
                    {"typeId": item.attrib["typeId"],
                     "count": int(item.attrib.get("count", 1))}
                    for item in award_el.findall("item")
                ]
            rules = {"neededQuest": [], "playerLevel": None, "gender": None}
            rules_el = q.find("rules")
            if rules_el is not None:
                for needed in rules_el.findall("neededQuest"):
                    rules["neededQuest"].append(needed.attrib["id"])
                level_el = rules_el.find("playerLevel")
                if level_el is not None:
                    rules["playerLevel"] = (
                        int(level_el.attrib.get("min", 1)),
                        int(level_el.attrib.get("max", 999999)))
                gender_el = rules_el.find("gender")
                if gender_el is not None:
                    rules["gender"] = gender_el.attrib["value"]
            tasks = []
            tasks_el = q.find("tasks")
            if tasks_el is not None:
                task_elements = tasks_el.findall("task")
                skip_price = calculate_quest_skip_price(
                    award, len(task_elements))
                for task in task_elements:
                    tasks.append({
                        "type": task.attrib["type"],
                        "maxProgress": int(task.attrib.get("maxProgress", 1)),
                        "gold": skip_price,
                        "locationId": task.attrib.get("locationId"),
                        "workId": task.attrib.get("workId"),
                        "items": (
                            [task.attrib["typeId"]]
                            if task.attrib.get("typeId") else []
                        ) + [item.attrib["typeId"]
                             for item in task.findall("item")],
                    })
            quests[qid] = {
                "initial": q.attrib.get("initial") == "true",
                "award": award,
                "rules": rules,
                "tasks": tasks,
            }
        return quests

    def parse_gifts(self):
        doc = etree.parse("config_all_ru/modules/gifts/personalGifts.xml")
        root = doc.getroot()
        gifts = {"srGft1": {"loot": {}, "trifle": {}, "clothes": {},
                            "furniture": {}}}
        tmp = root.find(".//category[@typeIds='smallPersonalGift']"
                        "[@id='lootSmall']")
        for item in tmp.findall("item"):
            name = item.attrib["typeId"]
            min_ = int(item.attrib["minCount"])
            max_ = int(item.attrib["maxCount"])
            gifts["srGft"]["loot"][name] = {"min": min_, "max": max_}
        return gifts
