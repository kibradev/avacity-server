import argparse
import shutil
import struct
import zlib
from pathlib import Path


DEFINE_BINARY_DATA = 87


def tag_offset(body):
    nbits = body[0] >> 3
    rect_size = (5 + (nbits * 4) + 7) // 8
    return rect_size + 4


def encode_tag(code, payload):
    length = len(payload)
    if length < 63:
        return struct.pack("<H", (code << 6) | length) + payload
    return struct.pack("<HI", (code << 6) | 63, length) + payload


def patch_appconfig(payload):
    if b"<appconfig>" not in payload:
        return payload, False

    # AvaCity serves assets under /files on port 80.
    # Keep serverAddress host for game socket; put content under /files.
    replacements = (
        (
            b'contentBaseUrl="http://pnz-city.project"',
            b'contentBaseUrl="http://127.0.0.1/files"',
        ),
        (
            b'contentBaseUrlMirror="http://pnz-city.project"',
            b'contentBaseUrlMirror="http://127.0.0.1/files"',
        ),
        (b'serverAddress="pnz-city.project"', b'serverAddress="127.0.0.1"'),
        (
            b"http://pnz-city.project:8081/local_billing",
            b"http://127.0.0.1/local_billing",
        ),
        (
            b"http://pnz-city.project:8081/test_utils",
            b"http://127.0.0.1/test_utils",
        ),
        (
            b"http://pnz-city.project/social.php",
            b"http://127.0.0.1/social",
        ),
        (
            b"http://pnz-city.project/billing/localCallback.php",
            b"http://127.0.0.1/localCallback",
        ),
    )
    patched = payload
    for old, new in replacements:
        patched = patched.replace(old, new)
    return patched, patched != payload


def patch_application_config(payload):
    if b"<config>" not in payload or b"<accountHost>" not in payload:
        return payload, False

    patched = payload
    start = patched.find(b"<accountHost>")
    end = patched.find(b"</accountHost>", start)
    if start >= 0 and end >= 0:
        value_start = start + len(b"<accountHost>")
        patched = patched[:value_start] + b"localhost" + patched[end:]

    start = patched.find(b"<accountPort>")
    end = patched.find(b"</accountPort>", start)
    if start >= 0 and end >= 0:
        value_start = start + len(b"<accountPort>")
        patched = patched[:value_start] + b"8123" + patched[end:]

    return patched, patched != payload


def patch_swf(source, destination):
    raw = source.read_bytes()
    if raw[:3] != b"CWS":
        raise ValueError("Only zlib-compressed CWS files are supported")

    body = zlib.decompress(raw[8:])
    offset = tag_offset(body)
    output = bytearray(body[:offset])
    patched_tags = 0

    while offset < len(body):
        header = struct.unpack_from("<H", body, offset)[0]
        offset += 2
        code = header >> 6
        length = header & 63
        if length == 63:
            length = struct.unpack_from("<I", body, offset)[0]
            offset += 4

        payload = body[offset:offset + length]
        offset += length

        changed = False
        if code == DEFINE_BINARY_DATA:
            payload, appconfig_changed = patch_appconfig(payload)
            payload, application_changed = patch_application_config(payload)
            changed = appconfig_changed or application_changed

        if changed:
            patched_tags += 1
        output.extend(encode_tag(code, payload))

        if code == 0:
            output.extend(body[offset:])
            break

    if patched_tags == 0:
        raise RuntimeError("Embedded client configuration was not found")

    new_body = bytes(output)
    new_header = raw[:4] + struct.pack("<I", len(new_body) + 8)
    destination.write_bytes(new_header + zlib.compress(new_body, level=9))
    return patched_tags


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "source",
        nargs="?",
        type=Path,
        default=Path("files/pnz-city.swf"),
    )
    args = parser.parse_args()

    source = args.source.resolve()
    backup = source.with_name(f"{source.stem}.original{source.suffix}")
    if not backup.exists():
        shutil.copy2(source, backup)

    patched_tags = patch_swf(backup, source)
    print(f"Patched {patched_tags} embedded configuration tags")
    print(f"Original: {backup}")
    print(f"Patched:  {source}")


if __name__ == "__main__":
    main()
