#! /usr/bin/env bash
# fname: bash-task-runner-example-20260805.sh
# from: bash-task-runners-20260805.txt
#       https://hamvocke.com/blog/task-runners/
# 20260805 v1: OK to use 'set -e'
# last 20260805
# ---

set -e

usage() {
	printf "Usage: <scriptname> <action>\n"
	printf "       actions: - usage\n"

	for funcn in build run instal clean testing; do
		printf "                - ${funcn}\n"
	done
	printf "\n"
}

build() {
	printf "[INFO] building ...\n"
}

run() {
	printf "[INFO] running ...\n"
}

install() {
	printf "[INFO] installing ...\n"
}

clean() {
	printf "[INFO] cleaning ...\n"
}

testing() {
	printf "[INFO] running tests ...\n"
}

# MAIN
clear

# call the function with the name that was passed to this script - or show
# usage information if nothing was passed
${@:-usage}
printf "\n"

