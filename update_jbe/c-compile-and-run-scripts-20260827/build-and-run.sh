#! /usr/bin/env bash
# fname: build-and-run.sh
# 20260826 v1
# ---

if [ ! -d './bin/' ]; then
	mkdir -v ./bin
fi

if [ $# -ne 1 ]; then
	printf "[ERROR] no *.c file selected\n"
	exit
else
	APP="${1}"
	APPNAME="${APP%.*}"
fi

gcc -o ./bin/${APPNAME} ${APP} && ./bin/${APPNAME}


