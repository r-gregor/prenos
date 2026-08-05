#! /usr/bin/env bash
# fname: bash-task-runner-example-20260805.sh
# from: bash-task-runners-20260805.txt
#       https://hamvocke.com/blog/task-runners/
# 20260805 v1: OK to use 'set -e'
# 20260805 v2: choose action from fzf list
#              'set -e' must NOT be set or script exits before check for selection
#              and no [INFO] gets printed
# last 20260805
# ---

unset selection
FZFCMD_EN="fzf -e --reverse" # cygwin version does not support --width option

declare -a actions=("usage" "build" "run" "install" "clean" "testing")
selection=$(for action in "${actions[@]}"; do echo "${action}"; done | ${FZFCMD_EN})

if [ "${selection}" == "" ]; then
	printf "[INFO] no action selected\n\n"
	exit 0
fi

usage() {
	printf "Usage: <scriptname> <function name>\n"
	printf "    function names: - usage\n"

	for funcn in build run install clean testing; do
		printf "                    - ${funcn}\n"
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
# call the function with the name that was passed to this script - or show
# usage information if nothing was passed
${selection:-usage}
printf "\n"

