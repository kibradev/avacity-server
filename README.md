# AvaCity Server (Avataria)

A self-hosted game server for the Avataria / AvaCity client, based on
[AvaCity/avacity-2.0](https://github.com/AvaCity/avacity-2.0) (BSD 3-Clause)
with local modifications and a web frontend.

> **Security warning – read before exposing this to the internet**
> - `server.py` contains a **local-dev auth fallback**: when no session token is
>   sent, it accepts the claimed user ID as the login. Anyone who knows a user ID
>   can log in as that user. Use this only on `localhost` / a private network,
>   or remove the fallback before hosting publicly.
> - Change `session_secret` in `web.ini` (the repo ships `CHANGE_ME`).
> - Redis has no password by default. Keep it bound to localhost.
> - Do not commit your real `web.ini` or `utils/bot.ini` (they hold secrets).

## Requirements

- Linux or WSL2 (Ubuntu recommended)
- Python 3.8+
- Redis server
- Node.js 18+ (only if you want to rebuild the frontend)

## Quick setup

```bash
# 1. Clone
git clone https://github.com/kibradev/avacity-server.git
cd avacity-server

# 2. Start Redis
sudo apt install redis-server
sudo systemctl enable --now redis-server

# 3. Python environment
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

## Configuration

Edit `web.ini`:

| Key | Meaning |
|-----|---------|
| `server_ip` | IP the game client connects to |
| `web_port` | Web server port (80 needs root; use e.g. 8080 otherwise) |
| `web_address` | Public URL of the web server |
| `allow_reg` | `true` / `false` – open registration |
| `session_secret` | **Set a long random string** (`openssl rand -hex 32`) |
| `google_*`, `discord_*` | Optional OAuth login |

Optional Telegram / VK registration bots: configure `utils/bot.ini`.

## Run

Use two terminals (venv activated):

```bash
python server.py   # game server: TCP 8123, WebSocket 8765 (localhost)
python web.py      # web server + client files
```

Then open `http://<web_address>` in your browser.

## Optional: rebuild the frontend

```bash
cd frontend
npm install
npm run build      # outputs to frontend/dist
```

## VIP status

Players have no VIP by default. To grant it, add a key in Redis:

```
set uid:<id>:premium 0
```

## Project layout

| Path | Purpose |
|------|---------|
| `server.py`, `client.py`, `protocol.py` | Game server core |
| `modules/` | Game features (clubs, relations, shop, photo salon, jobs, ...) |
| `web.py`, `templates/`, `frontend/` | Web server and UI |
| `config_all_ru/`, `files/` | Game configs and client assets |
| `utils/`, `tools/` | Bots and helper / reverse-engineering scripts |

## License

BSD 3-Clause (see `LICENSE`). Original game assets under `files/` belong to
their respective owners.
