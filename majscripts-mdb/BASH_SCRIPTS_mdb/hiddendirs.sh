#! /usr/bin/env bash

if [ $# -eq 1 ]; then
	gCurrDir=$1
else
	gCurrDir=$PWD
fi

find ${gCurrDir} -maxdepth 1 -type d -name '.*' | cut -b 3- | xargs du -sh --total | sort -hr

