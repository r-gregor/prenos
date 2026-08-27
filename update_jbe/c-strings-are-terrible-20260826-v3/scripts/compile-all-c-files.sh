#! /usr/bin/env bash
# fname: compile-all-c-files.sh
# 20260826 v1
# ---

for APP in *.c; do gcc -o ./bin2/${APP%.*} ${APP}; done

