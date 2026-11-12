import logging

from modules.base_module import Module
from modules.location import refresh_avatar
import modules.notify as notify

class_name = "ChatDecor"


class ChatDecor(Module):
    prefix = "chtdc"

    def __init__(self, server):
        self.server = server
        self.commands = {"schtm": self.save_chat_decor_model}

    async def save_chat_decor_model(self, msg, client):
        r = self.server.redis
        logging.info("chtdc.schtm uid=%s msg=%s", client.uid, msg[2])
        if msg[2]["chtnwbd"]:  # new bubble
            bubble = msg[2]["chtdc"]["bdc"]
            if not bubble:
                await r.delete(f"uid:{client.uid}:bubble")
            elif not await self.server.inv[client.uid].get_item(bubble):
                bought = await self.buy_decor(bubble, client)
                logging.info("chtdc bdc=%s not owned, buy_decor -> %s",
                             bubble, bought)
                if bought:
                    await r.set(f"uid:{client.uid}:bubble", bubble)
            else:
                await r.set(f"uid:{client.uid}:bubble", bubble)
        if msg[2]["chtnwtc"]:  # new text color
            text_color = msg[2]["chtdc"]["tcl"]
            if not text_color:
                await r.delete(f"uid:{client.uid}:tcl")
            elif not await self.server.inv[client.uid].get_item(text_color):
                if await self.buy_decor(text_color, client):
                    await r.set(f"uid:{client.uid}:tcl", text_color)
            else:
                await r.set(f"uid:{client.uid}:tcl", text_color)
        if msg[2]["chtnwbt"]:  # new bubble type
            bubble_type = msg[2]["chtdc"]["bt"]
            if not bubble_type:
                await r.delete(f"uid:{client.uid}:bblt")
            elif not await self.server.inv[client.uid].get_item(bubble_type):
                if await self.buy_decor(bubble_type, client):
                    await r.set(f"uid:{client.uid}:bblt", bubble_type)
            else:
                await r.set(f"uid:{client.uid}:bblt", bubble_type)
        bubble = await r.get(f"uid:{client.uid}:bubble")
        text_color = await r.get(f"uid:{client.uid}:tcl")
        bubble_type = await r.get(f"uid:{client.uid}:bblt")
        spks = ["bushStickerPack", "froggyStickerPack", "doveStickerPack",
                "jackStickerPack", "catStickerPack", "sharkStickerPack"]
        await client.send(["ntf.chtdcm", {"chtdc": {"bdc": bubble,
                                                    "bt": bubble_type,
                                                    "spks": spks,
                                                    "tcl": text_color}}])
        await client.send(["chtdc.schtm", {}])
        await refresh_avatar(client, self.server)

    async def buy_decor(self, item, client):
        items = self.server.game_items["game"]
        if item not in items:
            logging.info("buy_decor: %s not in game_items['game']", item)
            return False
        if not items[item]["canBuy"]:
            logging.info("buy_decor: %s canBuy=False", item)
            return False
        gold_price = items[item]["gold"]
        silver_price = items[item]["silver"]
        if not gold_price and not silver_price:
            logging.info("buy_decor: %s has no gold or silver price (%s)",
                         item, items[item])
            return False
        user_data = await self.server.get_user_data(client.uid)
        if user_data["gld"] < gold_price or user_data["slvr"] < silver_price:
            logging.info("buy_decor: %s price=gld:%s/slvr:%s but uid=%s has "
                         "gld=%s/slvr=%s", item, gold_price, silver_price,
                         client.uid, user_data["gld"], user_data["slvr"])
            return False
        r = self.server.redis
        if gold_price:
            await r.set(f"uid:{client.uid}:gld", user_data["gld"]-gold_price)
        if silver_price:
            await r.set(f"uid:{client.uid}:slvr",
                        user_data["slvr"]-silver_price)
        await self.server.inv[client.uid].add_item(item, "gm")
        await client.send(["ntf.inv", {"it": {"c": 1, "iid": "",
                                              "tid": item}}])
        await notify.update_resources(client, self.server)
        return True
