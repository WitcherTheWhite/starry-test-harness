#!/usr/bin/env bash
set -euo pipefail

workers=${1:-4}
iterations=${2:-1000}

run_worker() {
  local id=$1
  local iters=$2
  local sum=0
  for ((i=0; i<iters; ++i)); do
    sum=$((sum + i + id))
  done
  echo "[daily-worker-$id] sum=$sum"
}

pids=()
for ((w=0; w<workers; ++w)); do
  run_worker $w $iterations &
  pids+=("$!")
done

for pid in "${pids[@]}"; do
  wait "$pid"
done

echo "[daily] completed ${workers} concurrent workers"
