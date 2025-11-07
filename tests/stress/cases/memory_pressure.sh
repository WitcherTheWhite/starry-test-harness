#!/usr/bin/env bash
set -euo pipefail

limit_mb=${1:-64}
python3 - "$limit_mb" <<'PY'
import os
import sys
limit = int(sys.argv[1])
buffer = bytearray(limit * 1024 * 1024)
for idx in range(0, len(buffer), 1024 * 1024):
    buffer[idx] = (idx // (1024 * 1024)) % 256
print(f"[stress] touched {limit}MiB without OOM")
PY
