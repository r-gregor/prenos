#! /usr/bin/env bash
# fname: task-runner-simple.sh
# from: bash-task-runners-20260805.txt
#       https://hamvocke.com/blog/task-runners/
# 20260805 v1: OK to use 'set -e'
# 20260805 v2: actions in array --> feed actions into usage list from array
#              accept only part of the action name and crash if more than one
#              possible acctions can be selected or action not in the list
# last 20260805
# ---

unset selection
unset action
unset actions
unset selections

declare -a actions=("usage" "build" "run" "install" "clean" "testing" "close")
declare -a selections=()

usage() {
	printf "\n"
	printf "Usage: <scriptname> <action>\n"
	printf "       actions: - ${actions[0]}\n"

	for ((i=1; i < "${#actions[@]}"; i++ )); do
		printf "                - ${actions[$i]}\n"
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

close() {
	printf "[INFO] closing ...\n"
}

testing() {
	printf "[INFO] running tests ...\n"
}

run_action() {
	local scount=0
	local selection
	selection=$1

	for EL in "${actions[@]}"; do
		if [[ "${EL}" =~ "${selection}" ]]; then
			action=${EL}
			selections+=("${action}")
			# (( scount++ ))
		else
			continue
		fi
	done
	
	# if [  ${scount} -ne 1 ]; then
	# 	printf "[ERROR] no such action\n\n"
	# 	exit 1
	# fi

	NUM="${#selections[@]}"
	if [ "${NUM}" -gt 1 ]; then
		printf "[ERROR] too many possible actions: "
		for (( i=0; i < ${NUM} - 1; i++ )); do
			printf "${selections[$i]}, "
		done
		printf "${selections[(( ${NUM} - 1 ))]}\n"
		printf "\n"
		exit 1
	elif [ "${NUM}" -eq 0 ]; then
		printf "[ERROR] wrong action\n"
		printf "\n"
		exit 1
	fi

	${action}
}

# MAIN
clear

if [ $# -ne 1 ]; then
	usage
	exit 1
fi

run_action $1
printf "\n"

