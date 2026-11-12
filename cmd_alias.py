# Client (pnz-city.swf) obfuscates house extension command names.
# Incoming: translate obfuscated -> classic before module routing.
# Outgoing: translate classic -> obfuscated before send.
#
# Command tokens were recovered from the decompiled client classes:
#   §_-qH§.§_-8uS§   -> house-level commands (prefix "#hfwRG2.")
#   §_-6GW§.§_-C9t§  -> room sub-commands (segment "#bchYr.")
#   §_-6GW§.§_-E1§   -> listener->handler wiring (jn/lv/info/rfr/...)

HOUSE_OBF_PREFIX = "#hfwRG2."
HOUSE_PLAIN_PREFIX = "h."

# Room sub-namespace segment shared by every location's room commands.
ROOM_OBF_SEG = "#bchYr."

# classic room sub-command  ->  obfuscated token (inside "#bchYr.")
_ROOM_SUB_OUT = {
    "info": "#$=chq",    # §_-CDg§ onGetRoomInfo
    "jn":   "#hiIkBh",   # §_-1Sw§ onJoinRoom
    "lv":   "#hztdMS",   # §_-1cS§ onLeaveRoom
    "rfr":  "#bpYNoO",   # §_-8RF§ onRefreshRoom
    "ra":   "#hdpzbS",   # §_-6eT§ onRefreshAvatar
    "u":    "#bVp1lD",   # MOVE (current pnz-city.swf)
    "m":    "#bQT2uo",   # walk segment (sx/sy -> dx/dy)
    "kc":   "#bgRghH",   # §_-CVd§ onKick
}
_ROOM_SUB_IN = {v: k for k, v in _ROOM_SUB_OUT.items()}

# obfuscated house-level suffix -> classic suffix
_HOUSE_SUFFIX_IN = {
    "#hBEILp": "minfo",           # get my info
    "#hQcXSp": "oinfo",           # owner info
    "#htQ00p": "ioinfo",          # init owner info
    "#fg=wq": "oah",              # owner at house
}
_HOUSE_SUFFIX_OUT = {v: k for k, v in _HOUSE_SUFFIX_IN.items()}

# Furniture extension (§_-CEr§/§_-0jY§) uses its own prefix on the house
# connection. Buy/save/rename commands were missing, so purchases hung with
# the buy button locked forever waiting for ntf.inv.
FURNITURE_OBF_PREFIX = "#h=eFX!."
FURNITURE_PLAIN_PREFIX = "frn."

_FURNITURE_SUFFIX_IN = {
    "#p3Pq3": "buy",     # buyFurniture
    "#ojemK": "bnrm",     # buyRoom
    "#boqrI0": "rnmrm",   # renameRoom
    "#h!ucjD": "save",    # save layout
    "#bY+5!=": "bap",     # buy and place
}
_FURNITURE_SUFFIX_OUT = {v: k for k, v in _FURNITURE_SUFFIX_IN.items()}

# Account zone extension (§_-8sl§/§_-6t9§) obfuscates appearance and
# clothes commands. Clothes buy/wear responses must use the same obfuscated
# wire name the client registered (§_-5QW§); see echo_cmd in client.py.
ACCOUNT_OBF_PREFIX = "#bQ5fmf."
ACCOUNT_APPRNC_SEG = "#h+RRH$."
ACCOUNT_CLOTHES_SEG = "#btBocf."

_ACCOUNT_APPRNC_SUFFIX_IN = {
    "#h!ucjD": "save",
    "#b=DrS9": "rnn",
}
_ACCOUNT_CLOTHES_SUFFIX_IN = {
    "#p3Pq3": "buy",
    "#hhfovC": "bcc",
    "#hNxBvG": "wear",
    "#Z6Mrd": "bac",
    "#bSDolT": "bac",
    "#bRHC4o": "bac",
    "gbuy": "gbuy",
}

# Batch player-info lookup ("resolve these uids into display info for
# widget X") obfuscates its whole command. Captured from client console:
# {"uids": [...], "clid": "competitionUserTop"} / {"...": "ClanActivityRatingTop"}
# is the exact shape modules/player.py's players_by_id() ("pl.gid"/"pl.gsid")
# expects and replies to with {"plrs": [...], "clid": ...}. Every rating/top
# list widget (honor board, competition top, clan activity top, ...) calls
# this to resolve uids to names/avatars; without the alias it fell into the
# generic "Command not found" branch and every such widget stayed empty.
PLAYER_BATCH_OBF_PREFIX = "#%pASc."
PLAYER_BATCH_PLAIN_PREFIX = "pl."

_PLAYER_BATCH_SUFFIX_IN = {
    "#hwBjeQ": "gid",
    "#o19Qx": "gsid",
}
_PLAYER_BATCH_SUFFIX_OUT = {v: k for k, v in _PLAYER_BATCH_SUFFIX_IN.items()}

_ACCOUNT_CMD_OUT = {
    "a.apprnc.save": ACCOUNT_OBF_PREFIX + ACCOUNT_APPRNC_SEG + "#h!ucjD",
    "a.apprnc.rnn": ACCOUNT_OBF_PREFIX + ACCOUNT_APPRNC_SEG + "#b=DrS9",
    "a.clths.buy": ACCOUNT_OBF_PREFIX + ACCOUNT_CLOTHES_SEG + "#p3Pq3",
    "a.clths.bcc": ACCOUNT_OBF_PREFIX + ACCOUNT_CLOTHES_SEG + "#hhfovC",
    "a.clths.bac": ACCOUNT_OBF_PREFIX + ACCOUNT_CLOTHES_SEG + "#Z6Mrd",
    "a.clths.wear": ACCOUNT_OBF_PREFIX + ACCOUNT_CLOTHES_SEG + "#hNxBvG",
}
_ACCOUNT_CMD_IN = {v: k for k, v in _ACCOUNT_CMD_OUT.items()}


def rewrite_cmd_in(cmd):
    """Translate client->server house/account command name."""
    if not isinstance(cmd, str):
        return cmd
    if cmd in _ACCOUNT_CMD_IN:
        return _ACCOUNT_CMD_IN[cmd]
    if cmd.startswith(FURNITURE_OBF_PREFIX):
        suffix = cmd[len(FURNITURE_OBF_PREFIX):]
        plain = _FURNITURE_SUFFIX_IN.get(suffix)
        if plain:
            return FURNITURE_PLAIN_PREFIX + plain
    if cmd.startswith(PLAYER_BATCH_OBF_PREFIX):
        suffix = cmd[len(PLAYER_BATCH_OBF_PREFIX):]
        plain = _PLAYER_BATCH_SUFFIX_IN.get(suffix)
        if plain:
            return PLAYER_BATCH_PLAIN_PREFIX + plain
    if cmd.startswith(ACCOUNT_OBF_PREFIX):
        if ACCOUNT_CLOTHES_SEG in cmd:
            suffix = cmd.split(ACCOUNT_CLOTHES_SEG, 1)[1]
            plain = _ACCOUNT_CLOTHES_SUFFIX_IN.get(suffix)
            if plain:
                return "a.clths." + plain
        if ACCOUNT_APPRNC_SEG in cmd:
            suffix = cmd.split(ACCOUNT_APPRNC_SEG, 1)[1]
            plain = _ACCOUNT_APPRNC_SUFFIX_IN.get(suffix)
            if plain:
                return "a.apprnc." + plain
    if cmd.startswith(HOUSE_OBF_PREFIX):
        rest = cmd[len(HOUSE_OBF_PREFIX):]
        if rest.startswith(ROOM_OBF_SEG):
            token = rest[len(ROOM_OBF_SEG):]
            sub = _ROOM_SUB_IN.get(token, token)
            return HOUSE_PLAIN_PREFIX + "r." + sub
        if rest in _HOUSE_SUFFIX_IN:
            return HOUSE_PLAIN_PREFIX + _HOUSE_SUFFIX_IN[rest]
        # e.g. #hfwRG2.gr -> h.gr
        return HOUSE_PLAIN_PREFIX + rest
    # Non-house zones (outside/work/clan) don't wrap their whole extension
    # in an obfuscated prefix - only the room sub-command segment is
    # obfuscated, directly after the plain zone prefix, e.g.
    # "o.#bchYr.#$=chq" -> "o.r.info". Without this, every room sub-command
    # (info/jn/lv/rfr/ra/u/kc) outside the house silently falls into the
    # "Command ... not found" branch in server.py, so location screens
    # (cafe/club/canyon/...) never receive room info and stay stuck loading.
    if "." in cmd:
        prefix, rest = cmd.split(".", 1)
        if rest.startswith(ROOM_OBF_SEG):
            token = rest[len(ROOM_OBF_SEG):]
            sub = _ROOM_SUB_IN.get(token, token)
            return prefix + ".r." + sub
    return cmd


def rewrite_cmd_out(cmd):
    """Translate server->client house/account command name."""
    if not isinstance(cmd, str):
        return cmd
    if cmd in _ACCOUNT_CMD_OUT:
        return _ACCOUNT_CMD_OUT[cmd]
    if cmd.startswith(FURNITURE_PLAIN_PREFIX):
        rest = cmd[len(FURNITURE_PLAIN_PREFIX):]
        if rest in _FURNITURE_SUFFIX_OUT:
            return FURNITURE_OBF_PREFIX + _FURNITURE_SUFFIX_OUT[rest]
    if cmd.startswith(PLAYER_BATCH_PLAIN_PREFIX):
        rest = cmd[len(PLAYER_BATCH_PLAIN_PREFIX):]
        if rest in _PLAYER_BATCH_SUFFIX_OUT:
            return PLAYER_BATCH_OBF_PREFIX + _PLAYER_BATCH_SUFFIX_OUT[rest]
    if cmd.startswith(HOUSE_PLAIN_PREFIX):
        rest = cmd[len(HOUSE_PLAIN_PREFIX):]
        if rest.startswith("r."):
            sub = rest[2:]
            token = _ROOM_SUB_OUT.get(sub, sub)
            return HOUSE_OBF_PREFIX + ROOM_OBF_SEG + token
        if rest in _HOUSE_SUFFIX_OUT:
            return HOUSE_OBF_PREFIX + _HOUSE_SUFFIX_OUT[rest]
        return HOUSE_OBF_PREFIX + rest
    # Non-house zones: the client's commandDispatcher listens for the raw
    # obfuscated wire string directly (e.g. §_-E1§.as registers
    # "o." + "#bchYr.#$=chq"), so a plain "o.r.info" is never matched and
    # onGetRoomInfo/onJoinRoom/etc. simply never fire - the room screen gets
    # created but stays stuck waiting for room data that technically
    # arrived under the wrong command name. Mirror rewrite_cmd_in's decode.
    if "." in cmd:
        prefix, rest = cmd.split(".", 1)
        if rest.startswith("r."):
            sub = rest[2:]
            token = _ROOM_SUB_OUT.get(sub, sub)
            return prefix + "." + ROOM_OBF_SEG + token
    return cmd
