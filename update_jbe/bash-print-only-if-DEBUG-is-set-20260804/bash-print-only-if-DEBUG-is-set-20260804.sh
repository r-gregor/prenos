#! /usr/bin/env bash
# fname: bash-print-only-if-DEBUG-set-20260804.sh
# 20260804 v1
# last: 20260804
# ---

debug() {
	# check if env var DEBUG is set:
	if [[ -n $DEBUG ]]; then
		# printf "[DEBUG] %s\n" "$@" >&2
		printf "[DEBUG] %s\n" "$@"
	fi
	return 0
}

main() {
	printf "This is always printed\n"
	debug "This is printed only if DEBUG is set"

	printf "\n"
	return 0
}

main "$@"

