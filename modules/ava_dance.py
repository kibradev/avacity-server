import logging
import random
from modules.base_module import Module
from modules.achievements import add_progress
from modules.leaderboard import add_activity, add_competition_score

class_name = "AvaDance"

# Wire namespace: lg.#6%oCb.* (§_-8HK§.as)
AD_PREFIX = "lg.#6%oCb."
CMD_START = AD_PREFIX + "#hKt4s2"
CMD_NEXT_SEQ = AD_PREFIX + "#h2ko9T"
CMD_INIT = AD_PREFIX + "#bpNJPc"
CMD_STEP = AD_PREFIX + "#bQT2uo"
CMD_GAME_OVER = AD_PREFIX + "#A2KqD"
CMD_START_DANCE = AD_PREFIX + "#3eTD!"

# Field keys (§_-59c§.as / §_-BB2§.as / §_-5ll§.as / §_-2Gq§.as)
SEQ_KEY = "#bHReX!"
SESSION_KEY = "#h$YKh3"
TICK_KEY = "#YB%0s"
LINE_KEY = "#bQT2uo"
SPEED_KEY = "#bHReX!"
SOUND_KEY = "#1ndHu"
ACTION_KEY = "#hH2dFH"
HEALTH_KEY = "#SRLAu"
POINTS_KEY = "#hXYBO"
COMBO_KEY = "#hD6PAu"
RESULT_KEY = "#bFmxaF"
STEPS_KEY = "#bCtF$i"
MODE_KEY = "#bQT2uo"

USER_ID_KEY = "#bWgI6M"
RESULT_POINTS_KEY = "#hunNPk"
RESULT_COMBO_KEY = "#X=Ck8"
BEST_COMBO_KEY = "#bGGDF9"
STEPS_ARRAY_KEY = "#bZrr+$"
BOOL1_KEY = "#bXO$nf"
BOOL2_KEY = "#bxz0rx"
WIN_COUNT_KEY = "#bTk%Ot"
AWARD_KEY = "#b96vQ7"
EXTRA_KEY = "#hXHDZi"
STEP_ID_KEY = "#bI7vLV"
STEP_COUNT_KEY = "#b8KBJ$"

# gamesConfig.xml avaDancers params (config_all_ru/location/gamesConfig.xml)
MAX_HEALTH = 100
CATCH_POINTS = 10
FAIL_HEALTH = 15
CATCH_HEALTH = 5
NOTE_SPEED = 5
NOTE_INTERVAL = 45
FIRST_NOTE_TICK = 120
NOTE_COUNT = 80
END_BUFFER = 400
INITIAL_CHUNK = 20
NEXT_CHUNK = 15

COMBO_CHECKPOINTS = [
    (50, 100), (100, 350), (250, 750), (500, 2500), (1000, 5000),
]
AWARDS_PVE = [
    (499, {"slvr": 250, "gld": 0, "enrg": 0}),
    (2000, {"slvr": 500, "gld": 0, "enrg": 0}),
    (5000, {"slvr": 2250, "gld": 0, "enrg": 0}),
    (20000, {"slvr": 0, "gld": 5, "enrg": 0}),
    (35000, {"slvr": 0, "gld": 25, "enrg": 0}),
]
SINGLE_GAME_PRICE = {"slvr": 0, "gld": 0, "enrg": 0, "rb": 0, "vtlt": 0,
                     "bns": 0}


class AvaDance(Module):
    prefix = "ad"

    def __init__(self, server):
        self.server = server
        self.sessions = {}
        self.commands = {}

    async def on_message(self, msg, client):
        cmd = msg[1]
        if not cmd.startswith(AD_PREFIX):
            logging.warning("AvaDance: unknown command %s", cmd)
            return
        token = cmd[len(AD_PREFIX):]
        try:
            if token == "#hKt4s2":
                await self.handle_start(msg, client)
            elif token == "#h2ko9T":
                await self.handle_next_sequence(msg, client)
            elif token == "#bQT2uo":
                await self.handle_step(msg, client)
            elif token == "#A2KqD":
                await self.handle_game_over(msg, client)
            else:
                logging.warning("AvaDance: unhandled token %s", token)
        except Exception:
            logging.exception("AvaDance error in %s uid=%s", cmd, client.uid)

    def create_session(self, game_id, uid, chart):
        end_tick = chart[-1][TICK_KEY] + END_BUFFER if chart else FIRST_NOTE_TICK
        self.sessions[game_id] = {
            "uid": uid,
            "chart": chart,
            "chart_by_tick": {s[TICK_KEY]: s for s in chart},
            "health": MAX_HEALTH,
            "points": 0,
            "combo": 0,
            "best_combo": 0,
            "end_tick": end_tick,
            "next_seq_idx": 0,
            "started": False,
            "combo_awarded": 0,
        }

    def drop_session(self, game_id):
        self.sessions.pop(game_id, None)

    def _game_id(self, room):
        return room.split("_")[-1]

    def _session(self, room):
        return self.sessions.get(self._game_id(room))

    @staticmethod
    def generate_chart(count=NOTE_COUNT):
        chart = []
        tick = FIRST_NOTE_TICK
        for _ in range(count):
            chart.append({
                TICK_KEY: tick,
                LINE_KEY: random.randint(0, 3),
                SPEED_KEY: NOTE_SPEED,
                SOUND_KEY: "",
                ACTION_KEY: "",
            })
            tick += random.randint(NOTE_INTERVAL - 10, NOTE_INTERVAL + 10)
        return chart

    @staticmethod
    def _step_payload(step):
        return {
            TICK_KEY: step[TICK_KEY],
            LINE_KEY: step[LINE_KEY],
            SPEED_KEY: step[SPEED_KEY],
            SOUND_KEY: step.get(SOUND_KEY, ""),
            ACTION_KEY: step.get(ACTION_KEY, ""),
        }

    def _sequence_payload(self, steps):
        return {SEQ_KEY: [self._step_payload(s) for s in steps]}

    def _award_for_points(self, points):
        award = {"slvr": 0, "gld": 0, "enrg": 0, "rb": 0, "vtlt": 0, "bns": 0}
        for threshold, tier in AWARDS_PVE:
            if points >= threshold:
                award = dict(tier)
        return award

    async def _deduct_entry_price(self, uid):
        price = SINGLE_GAME_PRICE
        if not any(price.get(k, 0) for k in ("slvr", "gld", "enrg")):
            return True
        user = await self.server.get_user_data(uid)
        if user["slvr"] < price.get("slvr", 0):
            return False
        if user["gld"] < price.get("gld", 0):
            return False
        if user["enrg"] < price.get("enrg", 0):
            return False
        pipe = self.server.redis.pipeline()
        pipe.decrby(f"uid:{uid}:slvr", price.get("slvr", 0))
        pipe.decrby(f"uid:{uid}:gld", price.get("gld", 0))
        pipe.decrby(f"uid:{uid}:enrg", price.get("enrg", 0))
        await pipe.execute()
        return True

    async def _apply_award(self, uid, award):
        if not any(award.get(k, 0) for k in ("slvr", "gld", "enrg")):
            return
        pipe = self.server.redis.pipeline()
        if award.get("slvr"):
            pipe.incrby(f"uid:{uid}:slvr", award["slvr"])
        if award.get("gld"):
            pipe.incrby(f"uid:{uid}:gld", award["gld"])
        if award.get("enrg"):
            pipe.incrby(f"uid:{uid}:enrg", award["enrg"])
        await pipe.execute()

    async def handle_start(self, msg, client):
        session = self._session(msg[0])
        if not session or session["uid"] != client.uid:
            return
        if session["started"]:
            return
        mode = msg[2].get(MODE_KEY, "pveMode")
        if mode != "pveMode":
            logging.info("AvaDance: ignoring non-PvE start mode=%s", mode)
            return
        if not await self._deduct_entry_price(client.uid):
            logging.warning("AvaDance: uid=%s cannot afford entry", client.uid)
            return
        session["started"] = True
        chunk = session["chart"][:INITIAL_CHUNK]
        session["next_seq_idx"] = len(chunk)
        await client.send([CMD_INIT, {
            SEQ_KEY: self._sequence_payload(chunk)[SEQ_KEY],
            SESSION_KEY: {
                HEALTH_KEY: MAX_HEALTH,
                TICK_KEY: session["end_tick"],
            },
        }])
        await client.send([CMD_START_DANCE, {}])

    async def handle_next_sequence(self, msg, client):
        session = self._session(msg[0])
        if not session or session["uid"] != client.uid:
            return
        after_tick = msg[2].get(TICK_KEY, 0)
        chart = session["chart"]
        steps = [s for s in chart
                 if s[TICK_KEY] > after_tick][:NEXT_CHUNK]
        if not steps:
            await client.send([CMD_NEXT_SEQ, {SEQ_KEY: []}])
            return
        session["next_seq_idx"] = max(session["next_seq_idx"],
                                      steps[-1][TICK_KEY])
        await client.send([CMD_NEXT_SEQ, self._sequence_payload(steps)])

    def _apply_combo_bonus(self, session):
        for threshold, bonus in COMBO_CHECKPOINTS:
            if session["combo"] >= threshold > session["combo_awarded"]:
                session["points"] += bonus
                session["combo_awarded"] = threshold

    async def handle_step(self, msg, client):
        session = self._session(msg[0])
        if not session or session["uid"] != client.uid:
            return
        tick = msg[2].get(TICK_KEY, 0)
        line = msg[2].get(LINE_KEY, -1)
        expected = session["chart_by_tick"].get(tick)
        if expected and expected[LINE_KEY] == line:
            session["combo"] += 1
            session["best_combo"] = max(session["best_combo"], session["combo"])
            session["points"] += CATCH_POINTS
            self._apply_combo_bonus(session)
            session["health"] = min(MAX_HEALTH,
                                    session["health"] + CATCH_HEALTH)
        else:
            session["combo"] = 0
            session["combo_awarded"] = 0
            session["health"] = max(0, session["health"] - FAIL_HEALTH)
        await client.send([CMD_STEP, {
            TICK_KEY: tick,
            LINE_KEY: line,
            POINTS_KEY: session["points"],
            COMBO_KEY: session["combo"],
            HEALTH_KEY: session["health"],
        }])

    async def handle_game_over(self, msg, client):
        session = self._session(msg[0])
        if not session or session["uid"] != client.uid:
            return
        game_id = self._game_id(msg[0])
        points = session["points"]
        combo = session["combo"]
        best_combo = session["best_combo"]
        award = self._award_for_points(points)
        await self._apply_award(client.uid, award)
        await add_competition_score(self.server, client.uid,
                                    "dancescore", points)
        await add_activity(self.server, client.uid,
                           min(50, max(1, points // 100)))
        await add_progress(client.uid, self.server, "avaDancerPVE", points)
        steps_arr = []
        for item in msg[2].get(STEPS_KEY, []):
            if isinstance(item, dict):
                steps_arr.append({
                    STEP_ID_KEY: item.get(STEP_ID_KEY, ""),
                    STEP_COUNT_KEY: item.get(STEP_COUNT_KEY, 0),
                })
        await client.send([CMD_GAME_OVER, {
            RESULT_KEY: {
                USER_ID_KEY: client.uid,
                RESULT_POINTS_KEY: points,
                RESULT_COMBO_KEY: combo,
                BEST_COMBO_KEY: best_combo,
                STEPS_ARRAY_KEY: steps_arr,
                BOOL1_KEY: False,
                BOOL2_KEY: False,
                WIN_COUNT_KEY: 0,
                EXTRA_KEY: 0,
                AWARD_KEY: award,
            },
        }])
        self.drop_session(game_id)
        lg = self.server.modules["lg"]
        if game_id in lg.games:
            del lg.games[game_id]
