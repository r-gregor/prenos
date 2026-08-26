#! /usr/bin/env bash
# fname: build-and-run.sh
# 20260826 v1
# ---

if [ ! -d './bin/' ]; then
	mkdir -v ./bin
fi

readarray -t APPS < <(ls *.c)

for APP in "${APPS[@]}"; do
	APPNAME="${APP%.*}"
	printf "gcc -o ./bin/%s %s && ./bin/%s\n" "${APPNAME}" "${APP}" "${APPNAME}"
done

exit

gcc -o ./bin/c-string-to-string-view-testing c-string-to-string-view-testing.c && ./bin/c-string-to-string-view-testing

for APP in *.c; do gcc -o ${APP%.*} ${APP}; done

