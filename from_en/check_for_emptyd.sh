#! /usr/bin/env bash

if [ $# -ne 1 ]; then
	curdir="."
else
	curdir="$1"
fi

testd=$(realpath ${curdir})
# testd="${HOME}/_NERAZPOREJENO/__DANES__"

if [ "$(ls -A ${testd})" ]; then
	echo "[INFO] ${testd} is NOT empty"
else
	echo "[INFO] ${testd} is empty"
fi
