#! /usr/bin/env bash
# fname: test-if-number.sh
# 20260903 v1
# last 20260903
# ---

# test if $NN is number exclusive 0 ([1-9]):
# if 0 inclusive: need to check for nums begginning with 08
# as it interprets it as octal ...
if ! [[ "${NN}" =~ ^[1-9]+$ ]]; then
	printf "[ERROR] argument is not a positive nubmer\n\n"
	exit 1
fi

