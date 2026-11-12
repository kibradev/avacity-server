#!/usr/bin/env python3
import subprocess, sys, os, time, signal

BASE = "/opt/avacity/base"

def check_deps():
    try:
        import websockets, redis  # noqa
        print("deps ok")
    except Exception as e:
        print("DEP ERROR:", e)
        sys.exit(1)

def kill_old():
    subprocess.run(["pkill", "-f", "python.* server.py"], check=False)
    subprocess.run(["pkill", "-f", "python.* web.py"], check=False)
    subprocess.run(["pkill", "-f", "server.py"], check=False)
    subprocess.run(["pkill", "-f", "web.py"], check=False)
    time.sleep(1)

def start(name, logfile):
    logf = open(logfile, "wb")
    env = dict(os.environ)
    env["PYTHONUNBUFFERED"] = "1"
    p = subprocess.Popen(
        [sys.executable, name],
        cwd=BASE,
        stdout=logf,
        stderr=subprocess.STDOUT,
        stdin=subprocess.DEVNULL,
        start_new_session=True,
        env=env,
    )
    print(f"started {name} pid={p.pid} -> {logfile}")
    return p

if __name__ == "__main__":
    check_deps()
    kill_old()
    start("server.py", "/tmp/server.log")
    start("web.py", "/tmp/web.log")
    time.sleep(4)
    for f in ("/tmp/server.log", "/tmp/web.log"):
        print(f"===== {f} =====")
        try:
            with open(f) as fh:
                print(fh.read()[-2000:])
        except Exception as e:
            print("read err", e)
