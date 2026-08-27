#! /usr/bin/env bash
# fname: build-and-run.sh
# 20260826 v1
# ---

if [ ! -d './bin/' ]; then
	mkdir -v ./bin
fi

gcc -o ./bin/c-string-to-string-view-testing c-string-to-string-view-testing.c && ./bin/c-string-to-string-view-testing


