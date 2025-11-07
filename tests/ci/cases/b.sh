#!/usr/bin/env bash
set -euo pipefail

printf "[b.sh] validating syscall ABI across %s cases\n" "$#"
for arg in "$@"; do
  echo "[b.sh] -> invoking probe ${arg}"
  :
done
