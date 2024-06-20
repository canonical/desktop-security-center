#!/usr/bin/env sh

prefix="$1"

printf "test\n" > "${SNAP_REAL_HOME}/test/${prefix}/nested/test.txt"
