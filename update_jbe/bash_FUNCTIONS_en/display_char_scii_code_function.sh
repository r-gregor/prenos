
display_char_scii_code() {
	local c="${1}"
	# to print char as number must be inside double quotes preapended with single quote
	printf "ASCII code of character %s is: %d\n" "${c}" "'${c}"
}

# Usage
LC_ALL=c # to reas byte by byte !!

if [[ $# -eq 1 ]]; then
	maj_nejm="${1}"
else
	maj_nejm="Gregor Redelonghi"
fi

for ((i=0; i < ${#maj_nejm}; i++)); do
	# echo "${maj_nejm:${i}:1}"
	display_char_scii_code "${maj_nejm:${i}:1}"
done

