#! /usr/bin/env bash
# filename: get_longest_line.sh
# 20260304 en v1
# last 20260304
# ---

declare -a lines=(
	"Gregor Redelonghi, Valvasorjeva ulica 5, 1000 Ljubljana"
	"Tadeja Mali Redelonghi, Valvasorjeva ulica 5, 1000 Ljubljana"
	"Špela Redelonghi, Valvasorjeva ulica 5, 1000 Ljubljana"
	"Zala Redelonghi, Kunaverjeva ulica 8, 1000 Ljubljana"
	"Mark Redelonghi, Kunaverjeva ulica 8, 1000 Ljubljana"
)

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

print_longest() {
	local len=0
	local longest

	for line in "${lines[@]}"; do
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

get_longest() {
	local len=0
	local longest

	for line in "${lines[@]}"; do
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

print_table() {
	local lline="$(get_longest)"

	put_line_double "${lline}"
	printf "%s\n" "Address list"
	put_line_single "${lline}"
	for addr in "${lines[@]}"; do
		printf "%s\n" "${addr}"
	done
	put_line_double "${lline}"
	printf "\n"
}

print_table
print_longest

