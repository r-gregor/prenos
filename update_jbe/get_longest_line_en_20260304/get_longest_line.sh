#! /usr/bin/env bash
# filename: get_longest_line.sh
# 20260304 en v1
# 20260304 en v2: all functions refactored to accept external data as parameters
# last 20260304
# ---

declare -a lines=(
	"Gregor Redelonghi, Valvasorjeva ulica 5, 1000 Ljubljana"
	"Tadeja Mali Redelonghi, Valvasorjeva ulica 5, 1000 Ljubljana"
	"Špela Redelonghi, Valvasorjeva ulica 5, 1000 Ljubljana"
	"Zala Redelonghi, Kunaverjeva ulica 8, 1000 Ljubljana"
	"Mark Redelonghi, Kunaverjeva ulica 8, 1000 Ljubljana"
)

# print line of '-' same length as input string/sentence
put_line_single() {
	if [ ! $# -eq 1 ]; then
		return
	fi

	local llen="${#1}"

	for ((i = 0; i < $llen; i++ )) {
		printf "-"
	}
	printf "\n"
}

# print line of '=' same length as input string/sentence
put_line_double() {
	if [ ! $# -eq 1 ]; then
		return
	fi

	local llen="${#1}"

	for ((i = 0; i < $llen; i++ )) {
		printf "="
	}
	printf "\n"
}

# print longest string/sentence from indexed array supplied
# as parameter (new way):
# print_longest arrayname
print_longest() {
	if [ ! $# -eq 1 ]; then
		echo "[ERROR] must supply array of sentences as parameter"
		exit 1
	fi

	local len=0
	local longest
	local -n lines1=$1 # new way: must call array as < array_name >

	for line in "${lines1[@]}"; do
		llen="${#line}"
		if [ "${llen}" -gt "${len}" ]; then
			len="${llen}"
			longest="${line}"
		else
			continue
		fi
	done

	echo "Longest line:"
	echo "${longest}"
	printf "\n"
}

# return longest string/sentence from indexed array supplied
# as parameter (new way):
# get_longest arrayname
get_longest() {
	if [ ! $# -eq 1 ]; then
		echo "[ERROR1] must supply array of sentences as parameter"
		exit 1
	fi

	local len=0
	local longest
	local -n lines2=$1 # new way: must call array as < array_name >

	for line in "${lines2[@]}"; do
		llen="${#line}"
		if [ "${llen}" -gt "${len}" ]; then
			len="${llen}"
			longest="${line}"
		else
			continue
		fi
	done

	echo "${longest}"
}

# print formated table of array elements with lines long as longest
# string/sentence from indexed array supplied as parameter (old way):
# print_table_old arrayname[@]
print_table_old() {
	if [ ! $# -eq 1 ]; then
		echo "[ERROR2] must supply array of sentences as parameter"
		exit 1
	fi

	local lines3=("${!1}") # old way: must call array as < array_name[@] >
	local lline="$(get_longest lines3)"

	put_line_double "${lline}"
	printf "Longest line (**) is %d characters long\n" "${#lline}"
	put_line_single "${lline}"
	for addr in "${lines3[@]}"; do
		if [ "$addr" == "$lline" ]; then
			printf "%s\n" "${addr} **"
		else
			printf "%s\n" "${addr}"
		fi
	done
	put_line_double "${lline}"
	printf "\n"
}

# print formated table of array elements with lines long as longest
# string/sentence from indexed array supplied as parameter (new way):
# print_table_new arrayname
print_table_new() {
	if [ ! $# -eq 1 ]; then
		echo "[ERROR2] must supply array of sentences as parameter"
		exit 1
	fi

	local -n lines4=$1 # new way: must call array as < array_name >
	local lline="$(get_longest lines4)"

	put_line_double "${lline}"
	printf "Longest line (**) is %d characters long\n" "${#lline}"
	put_line_single "${lline}"
	for addr in "${lines4[@]}"; do
		if [ "$addr" == "$lline" ]; then
			printf "%s\n" "${addr} **"
		else
			printf "%s\n" "${addr}"
		fi
	done
	put_line_double "${lline}"
	printf "\n"
}
print_table_old lines[@] # old way
print_longest lines      # new way

declare -a german_words=(
	"Schornsteinpfleger"
	"zertifizierter Ingenieur"
	"Rindfleischetikettierungsüberwachungsaufgabenübertragungsgesetz"
	"Schornsteinfeger"
	"Katzenliebhaber"
)

print_table_new german_words    # new way

