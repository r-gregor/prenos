#! /usr/bin/env bash
# fname: bash-print-asci-code-of-character-20260804.sh
# 20260804 v1
# last 20260804
# ---

if [[ $# -eq 1 ]]; then
	maj_nejm="${1}"
else
	maj_nejm="Gregor Redelonghi"
fi

display_char_scii_code() {
	local c="${1}"
	# to print char as number must be inside double quotes preapended with single quote
	printf "ASCII code of character %s is: %d\n" "${c}" "'${c}"
}


for ((i=0; i < ${#maj_nejm}; i++)); do
	# echo "${maj_nejm:${i}:1}"
	display_char_scii_code "${maj_nejm:${i}:1}"
done

