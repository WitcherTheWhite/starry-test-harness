#!/usr/bin/env bash
set -euo pipefail

python3 - <<'PY'
import sqlite3
conn = sqlite3.connect(':memory:')
cur = conn.cursor()
cur.execute('create table t(x int)')
cur.executemany('insert into t(x) values (?)', [(i,) for i in range(3)])
cur.execute('select sum(x) from t')
print('[sqlite.sh] sum=', cur.fetchone()[0])
conn.close()
PY
