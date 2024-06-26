#!/usr/bin/env sh
set -e

prefix="$1"
content="$2"

printf "%s" "$content" > "${SNAP_REAL_HOME}/test/${prefix}/test.txt"
echo "done"
