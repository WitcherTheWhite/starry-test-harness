#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 4 ]]; then
  echo "usage: $0 run <test> <arg1> <arg2> ..." >&2
  exit 2
fi

action=$1
shift
case_name=$1
shift

echo "[a.sh] action=${action} case=${case_name} args=$*"
python3 - "$@" <<'PY'
import sys
vals = [int(x) for x in sys.argv[1:]]
print(f"[a.sh] computed musl checksum={sum(vals)}")
PY
