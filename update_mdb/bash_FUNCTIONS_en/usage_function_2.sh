
usage() {
	printf "\n"
	printf "Usage: <scriptname> <action>\n"
	printf "       actions: - ${actions[0]}\n"

	for ((i=1; i < "${#actions[@]}"; i++ )); do
		printf "                - ${actions[$i]}\n"
	done
	printf "\n"
}

# Usage (in MAIN)
if [ $# -ne 1 ]; then
	usage
	exit 1
fi

