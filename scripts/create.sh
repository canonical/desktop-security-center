#!/usr/bin/env sh

prefix="$1"

printf "test\n" > "${SNAP_REAL_HOME}/test/${prefix}/test-1.txt"
printf "test\n" > "${SNAP_REAL_HOME}/test/${prefix}/test-2.txt"
printf "test\n" > "${SNAP_REAL_HOME}/test/${prefix}/test-3.txt"

echo "done"
