#! /usr/bin/env bash
# fname: bash-print-only-if-DEBUG-initialized.sh
# v1_20260803
# last: 20260803
# ---

debug() {
	if [[ -n $DEBUG ]]; then
		echo '[DEBUG]' "$@" >&2
	fi
	return 0
}

main() {
	printf "Test for sentences that are printed if DEBUG is initialized like this:\n \
	DEBUG=true ./bash-print-only-if-DEBUG-initialized.sh\n---\nResult:\n"

	debug "This is printed only if DEBUG is initialized!"
	echo "This is always printed"
}

main

