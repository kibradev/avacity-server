#!/usr/bin/env python3
"""Download missing CDN assets without replacing existing local files."""

import asyncio
import json
import os
from pathlib import Path
from xml.etree import ElementTree

import aiohttp


BASE = Path(__file__).resolve().parents[1]
FILES = BASE / "files"
CDN = "http://cdn-sp.tortugasocial.com/avataria-ru/"
CONCURRENCY = 12


def versioned_path(name, version):
    if "music" in name:
        return name
    stem, suffix = name.rsplit(".", 1)
    return f"{stem}_{version}.{suffix}"


async def fetch_manifest(session):
    async with session.get(CDN + "versions.json") as response:
        response.raise_for_status()
        return await response.json(content_type=None)


async def download(session, semaphore, remote_path):
    destination = FILES / remote_path
    if destination.exists():
        return "exists", remote_path

    async with semaphore:
        for attempt in range(3):
            try:
                async with session.get(CDN + remote_path) as response:
                    if response.status == 404:
                        return "not-found", remote_path
                    response.raise_for_status()
                    content = await response.read()
                destination.parent.mkdir(parents=True, exist_ok=True)
                temporary = destination.with_suffix(destination.suffix + ".part")
                temporary.write_bytes(content)
                os.replace(temporary, destination)
                print(f"Got {remote_path}", flush=True)
                return "downloaded", remote_path
            except (aiohttp.ClientError, asyncio.TimeoutError) as error:
                if attempt == 2:
                    return f"error: {error}", remote_path
                await asyncio.sleep(attempt + 1)


async def main():
    config = json.loads((BASE / "update.json").read_text())
    ignored = set(config["ignore"])
    timeout = aiohttp.ClientTimeout(total=180)
    connector = aiohttp.TCPConnector(limit=CONCURRENCY)

    async with aiohttp.ClientSession(
        timeout=timeout, connector=connector
    ) as session:
        manifest = await fetch_manifest(session)
        remote_paths = []
        for name, version in manifest.items():
            if name in ignored or version in name or "island" in name.lower():
                continue
            remote_paths.append(versioned_path(name, version))

        # update.py downloads these directly outside versions.json.
        remote_paths.extend(config["misc"])
        # Music tracks are direct, unversioned URLs in appconfig.xml and most
        # of them are absent from both versions.json and update.json.
        appconfig = ElementTree.parse(BASE / "templates" / "appconfig.xml")
        for track in appconfig.findall("./musicTracks/*"):
            if track.text:
                path = track.text.strip().lstrip("/")
                remote_paths.append(
                    path if path.startswith("music/") else "music/" + path
                )
        missing = sorted({p for p in remote_paths if not (FILES / p).exists()})
        print(
            f"Manifest entries: {len(manifest)}; missing assets: {len(missing)}",
            flush=True,
        )

        semaphore = asyncio.Semaphore(CONCURRENCY)
        results = await asyncio.gather(
            *(download(session, semaphore, path) for path in missing)
        )

    counts = {}
    failures = []
    for status, path in results:
        counts[status] = counts.get(status, 0) + 1
        if status not in {"downloaded", "exists"}:
            failures.append((status, path))
    print("Summary:", counts)
    for status, path in failures:
        print(f"{status}: {path}")


if __name__ == "__main__":
    asyncio.run(main())
