#! /usr/bin/env bash
# fname: bash-either-parameter-or-prompt-and-if-var-is-not-set-test.sh
# 20260903 v2: number of copies either as parameter to program, or prompt if no parameter
#              if number of copies not set, set it to 4
# last 20260903
# ---

# test if parameter, if not: prompt
if [ $# -eq 1 ]; then
	NN=$1
else
	read -r -p "Enter number of copies: " NN
fi

# -z ... if not set (length of $NN is zero)
# -n ... is set     (length of $NN is nonzero)
if [ -z $NN ]; then
	NN=4
fi

# test if $NN is number:
if [[ "${NN}" =~ ^[1-9]+$ ]]; then
	printf "[OK] it IS a number\n"
else
	printf "[ERROR] argument is not a positive nubmer\n\n"
	exit 1
fi

# everything OK so far:
printf "Num of copies is: %d\n\n" $NN

