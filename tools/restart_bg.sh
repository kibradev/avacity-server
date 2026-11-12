#!/bin/bash
set -e
cd /opt/avacity/base
if [ -x venv/bin/python3 ]; then
  PYTHON=venv/bin/python3
else
  PYTHON=$(command -v python3)
fi

# Stop old processes
pkill -f 'python.*server.py' 2>/dev/null || true
pkill -f 'python.*web.py' 2>/dev/null || true
sleep 1

if ! $PYTHON -c 'import aioredis, websockets, redis, aiohttp' 2>/dev/null; then
  echo "Missing deps for $PYTHON — use: venv/bin/pip install -r requirements.txt websockets aioredis"
  exit 1
fi

: > /tmp/server.log
: > /tmp/web.log

nohup $PYTHON server.py >> /tmp/server.log 2>&1 &
SPID=$!
nohup $PYTHON web.py >> /tmp/web.log 2>&1 &
WPID=$!

sleep 4
echo "server_pid=$SPID web_pid=$WPID"
pgrep -af 'server.py|web.py' || true
echo "--- server.log ---"
tail -5 /tmp/server.log || true
echo "--- web.log ---"
tail -3 /tmp/web.log || true
