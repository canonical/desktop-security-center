#!/usr/bin/env sh

prefix="$1"

cat "${SNAP_REAL_HOME}/test/${prefix}/nested/test.txt"
