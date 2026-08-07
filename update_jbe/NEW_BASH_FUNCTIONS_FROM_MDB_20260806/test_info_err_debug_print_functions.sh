
test_print() {
	# check if env var TEST is set:
	if [[ -n $TEST ]]; then
		printf "[TEST] "
		printf "$@"
	fi
	return 0
}

debug_print() {
	# check if env var DEBUG is set:
	if [[ -n $DEBUG ]]; then
		printf "[DEBUG] "
		printf "$@"
	fi
	return 0
}

info_print() {
	printf "[INFO] "
	printf "$@"
	return 0
}

err_print() {
	printf "[ERROR] "
	printf "$@"
	return 0
}

