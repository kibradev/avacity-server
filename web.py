import asyncio
import base64
import configparser
import glob
import hashlib
import hmac
import json
import os
import re
import secrets
from urllib.parse import urlencode
import redis
import aiohttp
from aiohttp import web
import aiohttp_session
import aiohttp_jinja2
import jinja2
from cryptography import fernet
from aiohttp_session.cookie_storage import EncryptedCookieStorage

routes = web.RouteTableDef()
xml = """<?xml version="1.0" ?>
<cross-domain-policy>
    <allow-access-from domain="*" />
</cross-domain-policy>"""

SUPPORTED_LANGS = ("ru", "tr")
EMAIL_RE = re.compile(r"^[^\s@]+@[^\s@]+\.[^\s@]+$")
config = configparser.ConfigParser()
config.read("web.ini")
if config["webserver"]["allow_reg"].lower() == "true":
    registation = True
else:
    registation = False


def _google_config():
    section = config["webserver"]
    client_id = (os.getenv("GOOGLE_CLIENT_ID") or
                 section.get("google_client_id", "")).strip()
    client_secret = (os.getenv("GOOGLE_CLIENT_SECRET") or
                     section.get("google_client_secret", "")).strip()
    redirect_uri = (os.getenv("GOOGLE_REDIRECT_URI") or
                    section.get("google_redirect_uri", "")).strip()
    if not redirect_uri:
        redirect_uri = section["web_address"].rstrip("/") + \
            "/auth/google/callback"
    return client_id, client_secret, redirect_uri


def _discord_config():
    section = config["webserver"]
    client_id = (os.getenv("DISCORD_CLIENT_ID") or
                 section.get("discord_client_id", "")).strip()
    client_secret = (os.getenv("DISCORD_CLIENT_SECRET") or
                     section.get("discord_client_secret", "")).strip()
    redirect_uri = (os.getenv("DISCORD_REDIRECT_URI") or
                    section.get("discord_redirect_uri", "")).strip()
    if not redirect_uri:
        redirect_uri = section["web_address"].rstrip("/") + \
            "/auth/discord/callback"
    return client_id, client_secret, redirect_uri


def get_level(exp):
    expSum = 0
    i = 0
    while expSum <= exp:
        i += 1
        expSum += i * 50
    return i


def _password_hash(password, salt=None):
    salt = salt or secrets.token_hex(16)
    digest = hashlib.pbkdf2_hmac("sha256", password.encode(),
                                 salt.encode(), 210000).hex()
    return f"{salt}${digest}"


def _password_matches(password, stored):
    try:
        salt, expected = stored.split("$", 1)
    except (AttributeError, ValueError):
        return False
    actual = _password_hash(password, salt).split("$", 1)[1]
    return hmac.compare_digest(actual, expected)


async def _session_uid(request):
    session = await aiohttp_session.get_session(request)
    uid = session.get("uid")
    return str(uid) if uid else None


def _create_account(email, name, password=None):
    uid = str(app["redis"].incr("uids"))
    token = secrets.token_urlsafe(24)
    pipe = app["redis"].pipeline()
    pipe.set(f"auth:{token}", uid)
    pipe.set(f"uid:{uid}:lvt", 0)
    pipe.set(f"uid:{uid}:email", email.lower())
    pipe.set(f"uid:{uid}:portal_name", name)
    pipe.set(f"email:{email.lower()}", uid)
    if password:
        pipe.set(f"uid:{uid}:password_hash", _password_hash(password))
    pipe.sadd(f"rooms:{uid}", "livingroom")
    pipe.rpush(f"rooms:{uid}:livingroom", "#livingRoom", 1)
    for i in range(1, 6):
        pipe.sadd(f"rooms:{uid}", f"room{i}")
        pipe.rpush(f"rooms:{uid}:room{i}", f"Комната {i}", 2)
    pipe.execute()
    return uid, token


@routes.get("/")
async def index(request):
    if os.path.exists("frontend/dist/index.html"):
        return web.FileResponse("frontend/dist/index.html")
    session = await aiohttp_session.get_session(request)
    context = {}
    if "token" not in session:
        context["logged_in"] = False
    else:
        context["logged_in"] = True
        context["token"] = session["token"]
        context["update_time"] = config["webserver"]["update_time"]
    return aiohttp_jinja2.render_template("index.html", request,
                                          context=context)


@routes.get("/api/auth/status")
async def auth_status(request):
    client_id, client_secret, _ = _google_config()
    discord_id, discord_secret, _ = _discord_config()
    return web.json_response({
        "registration": registation,
        "google": bool(client_id and client_secret),
        "discord": bool(discord_id and discord_secret),
    })


@routes.post("/api/auth/register")
async def api_register(request):
    if not registation:
        return web.json_response({"error": "Kayıtlar şu anda kapalı."},
                                 status=403)
    try:
        data = await request.json()
    except (json.JSONDecodeError, TypeError):
        return web.json_response({"error": "Geçersiz istek."}, status=400)
    email = str(data.get("email", "")).strip().lower()
    name = str(data.get("name", "")).strip()[:24]
    password = str(data.get("password", ""))
    if not EMAIL_RE.match(email) or not name or len(password) < 8:
        return web.json_response({
            "error": "Geçerli e-posta, oyuncu adı ve en az 8 karakterli şifre gerekli."
        }, status=400)
    if app["redis"].exists(f"email:{email}"):
        return web.json_response({"error": "Bu e-posta zaten kullanımda."},
                                 status=409)
    uid, token = _create_account(email, name, password)
    session = await aiohttp_session.new_session(request)
    session.update({"uid": uid, "token": token, "lang": "tr"})
    return web.json_response({"ok": True, "uid": uid})


@routes.post("/api/auth/login")
async def api_login(request):
    try:
        data = await request.json()
    except (json.JSONDecodeError, TypeError):
        return web.json_response({"error": "Geçersiz istek."}, status=400)
    identity = str(data.get("email", "")).strip().lower()
    password = str(data.get("password", ""))
    uid = app["redis"].get(f"email:{identity}")
    if not uid and identity.isdigit():
        uid = identity
    stored = app["redis"].get(f"uid:{uid}:password_hash") if uid else None
    legacy_uid = app["redis"].get(f"auth:{password}") if password else None
    valid_password = (_password_matches(password, stored) or
                      (uid is not None and str(legacy_uid) == str(uid)))
    if not uid or not valid_password:
        return web.json_response({"error": "E-posta veya şifre hatalı."},
                                 status=401)
    token = secrets.token_urlsafe(24)
    app["redis"].set(f"auth:{token}", uid)
    session = await aiohttp_session.new_session(request)
    session.update({"uid": str(uid), "token": token, "lang": "tr"})
    return web.json_response({"ok": True, "uid": str(uid)})


@routes.post("/api/auth/logout")
async def api_logout(request):
    session = await aiohttp_session.get_session(request)
    session.clear()
    return web.json_response({"ok": True})


@routes.get("/api/me")
async def api_me(request):
    uid = await _session_uid(request)
    if not uid:
        return web.json_response({"authenticated": False}, status=401)
    pipe = app["redis"].pipeline()
    for key in ("exp", "gld", "slvr", "enrg", "hrt", "crt", "portal_name",
                "email", "online", "lvt"):
        pipe.get(f"uid:{uid}:{key}")
    values = pipe.execute()
    appearance_name = app["redis"].lindex(f"uid:{uid}:appearance", 0)
    exp = int(values[0] or 0)
    return web.json_response({
        "authenticated": True,
        "user": {
            "id": uid,
            "name": appearance_name or values[6] or f"Oyuncu {uid}",
            "email": values[7] or "",
            "level": get_level(exp),
            "exp": exp,
            "gold": int(values[1] or 0),
            "silver": int(values[2] or 0),
            "energy": int(values[3] or 0),
            "honor": int(values[4] or 0),
            "rating": int(values[5] or 0),
            "online": bool(values[8]),
            "lastSeen": int(values[9] or 0),
        },
        "updateTime": config["webserver"]["update_time"],
    })


@routes.get("/api/friends")
async def api_friends(request):
    uid = await _session_uid(request)
    if not uid:
        raise web.HTTPUnauthorized()
    friends = []
    for link in app["redis"].smembers(f"rl:{uid}"):
        parts = link.split(":")
        if len(parts) != 2 or uid not in parts:
            continue
        friend_uid = parts[1] if parts[0] == uid else parts[0]
        status = int(app["redis"].get(f"rl:{link}:s") or 0)
        name = app["redis"].lindex(f"uid:{friend_uid}:appearance", 0)
        if not name:
            name = app["redis"].get(f"uid:{friend_uid}:portal_name")
        exp = int(app["redis"].get(f"uid:{friend_uid}:exp") or 0)
        friends.append({
            "id": friend_uid,
            "name": name or f"Oyuncu {friend_uid}",
            "level": get_level(exp),
            "online": bool(app["redis"].get(f"uid:{friend_uid}:online")),
            "lastSeen": int(app["redis"].get(f"uid:{friend_uid}:lvt") or 0),
            "relation": status,
        })
    friends.sort(key=lambda value: (not value["online"],
                                    value["name"].casefold()))
    return web.json_response({"friends": friends})


@routes.get("/auth/google")
async def google_login(request):
    client_id, client_secret, redirect_uri = _google_config()
    if not client_id or not client_secret:
        raise web.HTTPFound("/?auth=google-not-configured")
    session = await aiohttp_session.get_session(request)
    state = secrets.token_urlsafe(24)
    session["google_state"] = state
    query = urlencode({
        "client_id": client_id,
        "redirect_uri": redirect_uri,
        "response_type": "code",
        "scope": "openid email profile",
        "state": state,
        "prompt": "select_account",
    })
    raise web.HTTPFound("https://accounts.google.com/o/oauth2/v2/auth?" + query)


@routes.get("/auth/google/callback")
async def google_callback(request):
    session = await aiohttp_session.get_session(request)
    expected_state = session.pop("google_state", "")
    received_state = request.query.get("state", "")
    if (request.query.get("error") or not request.query.get("code") or
            not expected_state or not hmac.compare_digest(
                received_state, expected_state)):
        raise web.HTTPFound("/?auth=google-failed")
    client_id, client_secret, redirect_uri = _google_config()
    if not client_id or not client_secret:
        raise web.HTTPFound("/?auth=google-not-configured")
    payload = {
        "code": request.query["code"],
        "client_id": client_id,
        "client_secret": client_secret,
        "redirect_uri": redirect_uri,
        "grant_type": "authorization_code",
    }
    try:
        timeout = aiohttp.ClientTimeout(total=12)
        async with aiohttp.ClientSession(timeout=timeout) as http:
            async with http.post("https://oauth2.googleapis.com/token",
                                 data=payload) as response:
                token_data = await response.json()
                if response.status != 200:
                    raise web.HTTPFound("/?auth=google-failed")
            access_token = token_data.get("access_token")
            if not access_token:
                raise web.HTTPFound("/?auth=google-failed")
            async with http.get(
                    "https://openidconnect.googleapis.com/v1/userinfo",
                    headers={"Authorization":
                             f"Bearer {access_token}"}) as response:
                profile = await response.json()
                if response.status != 200:
                    raise web.HTTPFound("/?auth=google-failed")
    except (aiohttp.ClientError, asyncio.TimeoutError):
        raise web.HTTPFound("/?auth=google-failed")
    email = str(profile.get("email", "")).lower()
    google_sub = str(profile.get("sub", "")).strip()
    if (not google_sub or not profile.get("email_verified") or
            not EMAIL_RE.match(email)):
        raise web.HTTPFound("/?auth=google-failed")
    uid = app["redis"].get(f"google:{google_sub}")
    if not uid:
        uid = app["redis"].get(f"email:{email}")
    if uid:
        token = secrets.token_urlsafe(24)
        app["redis"].set(f"auth:{token}", uid)
    else:
        name = str(profile.get("name") or "Oyuncu").strip()[:24]
        uid, token = _create_account(email, name)
    app["redis"].set(f"google:{google_sub}", uid)
    session.update({"uid": str(uid), "token": token, "lang": "tr"})
    raise web.HTTPFound("/")


@routes.get("/auth/discord")
async def discord_login(request):
    client_id, client_secret, redirect_uri = _discord_config()
    if not client_id or not client_secret:
        raise web.HTTPFound("/?auth=discord-not-configured")
    session = await aiohttp_session.get_session(request)
    state = secrets.token_urlsafe(24)
    session["discord_state"] = state
    query = urlencode({
        "client_id": client_id,
        "redirect_uri": redirect_uri,
        "response_type": "code",
        "scope": "identify email",
        "state": state,
    })
    raise web.HTTPFound("https://discord.com/oauth2/authorize?" + query)


@routes.get("/auth/discord/callback")
async def discord_callback(request):
    session = await aiohttp_session.get_session(request)
    expected_state = session.pop("discord_state", "")
    received_state = request.query.get("state", "")
    if (request.query.get("error") or not request.query.get("code") or
            not expected_state or not hmac.compare_digest(
                received_state, expected_state)):
        raise web.HTTPFound("/?auth=discord-failed")
    client_id, client_secret, redirect_uri = _discord_config()
    if not client_id or not client_secret:
        raise web.HTTPFound("/?auth=discord-not-configured")
    payload = {
        "client_id": client_id,
        "client_secret": client_secret,
        "grant_type": "authorization_code",
        "code": request.query["code"],
        "redirect_uri": redirect_uri,
    }
    try:
        timeout = aiohttp.ClientTimeout(total=12)
        async with aiohttp.ClientSession(timeout=timeout) as http:
            async with http.post(
                    "https://discord.com/api/v10/oauth2/token",
                    data=payload) as response:
                token_data = await response.json()
                if response.status != 200:
                    raise web.HTTPFound("/?auth=discord-failed")
            access_token = token_data.get("access_token")
            if not access_token:
                raise web.HTTPFound("/?auth=discord-failed")
            async with http.get(
                    "https://discord.com/api/v10/users/@me",
                    headers={"Authorization":
                             f"Bearer {access_token}"}) as response:
                profile = await response.json()
                if response.status != 200:
                    raise web.HTTPFound("/?auth=discord-failed")
    except (aiohttp.ClientError, asyncio.TimeoutError):
        raise web.HTTPFound("/?auth=discord-failed")
    discord_id = str(profile.get("id", "")).strip()
    email = str(profile.get("email", "")).strip().lower()
    if (not discord_id or not profile.get("verified") or
            not EMAIL_RE.match(email)):
        raise web.HTTPFound("/?auth=discord-failed")
    uid = app["redis"].get(f"discord:{discord_id}")
    if not uid:
        uid = app["redis"].get(f"email:{email}")
    if uid:
        token = secrets.token_urlsafe(24)
        app["redis"].set(f"auth:{token}", uid)
    else:
        display_name = profile.get("global_name") or \
            profile.get("username") or "Oyuncu"
        uid, token = _create_account(email, str(display_name).strip()[:24])
    app["redis"].set(f"discord:{discord_id}", uid)
    session.update({"uid": str(uid), "token": token, "lang": "tr"})
    raise web.HTTPFound("/")


@routes.post("/login")
async def login(request):
    session = await aiohttp_session.new_session(request)
    data = await request.post()
    login_id = data["login"]
    password = data.get("password", "")
    lang = data.get("lang", "ru")
    if lang not in SUPPORTED_LANGS:
        lang = "ru"
    if password:
        uid = app["redis"].get(f"auth:{password}")
        if uid == login_id:
            session["uid"] = uid
            session["token"] = password
            session["lang"] = lang
    elif app["redis"].exists(f"uid:{login_id}:lvt"):
        # Test convenience: log in by ID only (no password), as long as
        # the account already exists. server.py's local auth fallback
        # doesn't actually validate this token against anything.
        session["uid"] = login_id
        session["token"] = login_id
        session["lang"] = lang
    raise web.HTTPFound("/")


@routes.get("/logout")
async def logout(request):
    session = await aiohttp_session.get_session(request)
    if "token" in session:
        del session["token"]
        del session["uid"]
    raise web.HTTPFound("/")


@routes.get("/register")
async def register(request):
    if not registation:
        return web.Response(text="Регистрация отключена")
    uid = app["redis"].incr("uids")
    password = secrets.token_urlsafe(15)
    pipe = app["redis"].pipeline()
    pipe.set(f"auth:{password}", uid)
    pipe.set(f"uid:{uid}:lvt", 0)
    pipe.sadd(f"rooms:{uid}", "livingroom")
    pipe.rpush(f"rooms:{uid}:livingroom", "#livingRoom", 1)
    for i in range(1, 6):
        pipe.sadd(f"rooms:{uid}", f"room{i}")
        pipe.rpush(f"rooms:{uid}:room{i}", f"Комната {i}", 2)
    pipe.execute()
    return web.Response(text=f"Аккаунт создан, ваш логин - {uid}, "
                             f"пароль - {password}")


@routes.get("/prelogin")
async def prelogin(request):
    if "sid" not in request.query:
        raise web.HTTPClientError()
    try:
        uid = int(request.query["sid"])
    except ValueError:
        raise web.HTTPClientError()
    exp = app["redis"].get(f"uid:{uid}:exp")
    exp = int(exp) if exp else 0
    return web.json_response({"user": {"bannerNetworkId": None, "reg": 0,
                                       "paymentGroup": "",
                                       "preloginModuleIds": "", "id": uid,
                                       "avatariaLevel": get_level(exp)}})


@routes.post("/social")
@routes.get("/social")
async def social(request):
    if request.method == "POST":
        data = await request.post()
    else:
        data = request.query
    method = data.get("method")
    if not method:
        raise web.HTTPClientError()

    # Resolve current session user (token query, form field, or cookie).
    uid = None
    token = (data.get("password") or data.get("token")
             or request.query.get("token"))
    if token:
        uid = app["redis"].get(f"auth:{token}")
    if not uid:
        session = await aiohttp_session.get_session(request)
        uid = session.get("uid")
        token = token or session.get("token")
    if not uid:
        uid = data.get("user_id") or data.get("uid")
    uid = str(uid) if uid else ""

    if method == "getTestUsers":
        # Local adapter expects {"users":[{sid,name,online}, ...]}.
        # If we know the session uid, return it. Otherwise HTTP 500 makes
        # the client fall back to init(appconfig.userId) without a picker.
        if uid:
            return web.json_response({"users": [{
                "id": uid,
                "sid": uid,
                "name": f"User {uid}",
                "online": False,
            }]})
        return web.Response(status=500)
    elif method == "getAuthorisedUserId":
        return web.json_response({"uid": uid})
    elif method in ["getFriends", "getAppFriends"]:
        return web.json_response([])
    elif method == "getProfiles":
        uids = str(data.get("uids", "")).split(",")
        profiles = []
        for profile_uid in uids:
            profile_uid = profile_uid.strip()
            if not profile_uid:
                continue
            profiles.append({
                "id": profile_uid,
                "sid": profile_uid,
                "name": f"User {profile_uid}",
                "online": False,
            })
        return web.json_response(profiles)
    elif method == "addUser":
        new_uid = str(app["redis"].incr("uids"))
        return web.json_response({
            "id": new_uid,
            "sid": new_uid,
            "name": f"User {new_uid}",
            "online": False,
        })
    return web.json_response({})


@routes.get("/appconfig.xml")
async def appconfig(request):
    token = request.query.get("token")
    uid = None
    if token:
        uid = app["redis"].get(f"auth:{token}")
    if not uid:
        session = await aiohttp_session.get_session(request)
        token = session.get("token")
        uid = session.get("uid")
    if not uid:
        raise web.HTTPUnauthorized()
    context = {"token": token, "uid": uid,
               "ip": config["webserver"]["server_ip"],
               "address": config["webserver"]["web_address"]}
    return aiohttp_jinja2.render_template("appconfig.xml", request,
                                          context=context)


@routes.get("/setlang")
async def setlang(request):
    session = await aiohttp_session.get_session(request)
    lang = request.query.get("lang", "ru")
    if lang not in SUPPORTED_LANGS:
        lang = "ru"
    session["lang"] = lang
    raise web.HTTPFound("/")


async def _lang_swap_response(request, default_path, glob_pattern):
    # The client's own embedded config always requests the "ru"-named
    # asset (its locale selection isn't controllable via appconfig.xml -
    # see project notes). To serve another language we intercept the
    # request here and swap in that language's file by content, keeping
    # the URL/hash the client asked for.
    session = await aiohttp_session.get_session(request)
    lang = session.get("lang", "ru")
    if lang != "ru":
        matches = sorted(glob.glob(glob_pattern % lang))
        if matches:
            return web.FileResponse(matches[0])
    return web.FileResponse(default_path)


# (route path, url hash param name, glob pattern with a single "%s" for lang,
#  versions.json key)
_LANG_SWAP_ASSETS = [
    # Prefer the "relabeled" config_all variant (see tools/relabel_locale.py)
    # where translation/*.xml's <locale name="..."> was rewritten to "ru" -
    # the client's own locale stays "ru" internally regardless of which
    # language's bytes we swap in, so an unrelabeled non-ru dictionary would
    # never match and every UI string falls back to showing its raw key.
    (r"/files/data/config_all_ru_{hash}.zip", "files/data/config_all_ru_{}.zip",
     "files/data/config_all_%s_relabeled_*.zip", "data/config_all_ru.zip"),
    (r"/files/swf/UiLang_ru_{hash}.swf", "files/swf/UiLang_ru_{}.swf",
     "files/swf/UiLang_%s_*.swf", "swf/UiLang_ru.swf"),
    (r"/files/swf/FortuneGame_ru_{hash}.swf", "files/swf/FortuneGame_ru_{}.swf",
     "files/swf/FortuneGame_%s_*.swf", "swf/FortuneGame_ru.swf"),
]

for _route_path, _default_tmpl, _glob_pattern, _versions_key in _LANG_SWAP_ASSETS:
    def _make_handler(default_tmpl, glob_pattern):
        async def handler(request):
            default_path = default_tmpl.format(request.match_info["hash"])
            return await _lang_swap_response(request, default_path, glob_pattern)
        return handler
    routes.get(_route_path)(_make_handler(_default_tmpl, _glob_pattern))


@routes.get("/files/versions.json")
async def versions_lang_swap(request):
    # The client checks each downloaded asset's MD5 against the hash
    # recorded here, keyed by the "ru"-named virtual path it always
    # requests. Since we swap in another language's bytes under that same
    # name (see _lang_swap_response above), the hash listed here must be
    # swapped to match, or the client reports the file as corrupted.
    session = await aiohttp_session.get_session(request)
    lang = session.get("lang", "ru")
    with open("files/versions.json") as f:
        data = json.load(f)
    if lang != "ru":
        for _, _, glob_pattern, versions_key in _LANG_SWAP_ASSETS:
            matches = sorted(glob.glob(glob_pattern % lang))
            if matches:
                stem = os.path.basename(matches[0]).rsplit("_", 1)[-1]
                data[versions_key] = os.path.splitext(stem)[0]
    return web.json_response(data)


@routes.get("/crossdomain.xml")
async def crossdomain(requst):
    return web.Response(text=xml)


routes.static("/files", "files")


@web.middleware
async def access_log_middleware(request, handler):
    try:
        resp = await handler(request)
    except web.HTTPException as ex:
        # Log every request (assets included) so the LAST line before the
        # client hangs pinpoints exactly which resource/step it waited on.
        # 4xx/5xx are prefixed with "!!" to make failures easy to spot.
        mark = "!!" if ex.status >= 400 else "  "
        print(f"{mark} HTTP {ex.status} {request.method} {request.path_qs}",
              flush=True)
        raise
    mark = "!!" if resp.status >= 400 else "  "
    print(f"{mark} HTTP {resp.status} {request.method} {request.path_qs}",
          flush=True)
    return resp


@routes.post("/client_log")
@routes.get("/client_log")
async def client_log(request):
    try:
        if request.method == "POST":
            body = await request.text()
        else:
            body = str(dict(request.query))
        print(f"CLIENT_LOG {body[:2000]}", flush=True)
    except Exception as e:
        print(f"CLIENT_LOG err {e}", flush=True)
    return web.Response(text="ok")


async def main():
    global app
    app = web.Application(middlewares=[access_log_middleware])
    app.add_routes(routes)
    if os.path.isdir("frontend/dist/assets"):
        app.router.add_static("/assets", "frontend/dist/assets")
    app["redis"] = redis.Redis(decode_responses=True)
    configured_secret = config["webserver"].get("session_secret", "")
    if configured_secret:
        secret_key = hashlib.sha256(configured_secret.encode()).digest()
    else:
        fernet_key = fernet.Fernet.generate_key()
        secret_key = base64.urlsafe_b64decode(fernet_key)
    aiohttp_session.setup(app, EncryptedCookieStorage(secret_key))
    aiohttp_jinja2.setup(app, loader=jinja2.FileSystemLoader("templates"))
    runner = web.AppRunner(app)
    await runner.setup()
    site = web.TCPSite(runner, "0.0.0.0", int(config["webserver"]["web_port"]))
    await site.start()


if __name__ == "__main__":
    loop = asyncio.new_event_loop()
    asyncio.set_event_loop(loop)
    loop.create_task(main())
    loop.run_forever()
