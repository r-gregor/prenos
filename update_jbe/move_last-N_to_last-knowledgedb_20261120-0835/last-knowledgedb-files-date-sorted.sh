#! /usr/bin/env bash
# fname: last-knowledgedb-files-date-sorted.sh
# descpt: List last 10 files from $KNOWLEDGEDB in all cathegories sorted by date
# 20261120
# last: 20261020
#---

# === GLOBALS ===
KNWLGDB="${HOME}/majstaf/${HST}git/knowledgedb"

# === FUNCTIONS ===
CMD1() {
	"${HOME}"/.local/bin/sort-files-by-end-date
}

CMD2() {
	"${HOME}"/.local/bin/rsort-by-tmstmp-c
}

usage() {
MSG=$(cat << HDOC

[!] usage:
    last-knowledgedb-files-date-sorted <args>
    args: -h       ... help
          -n <num> ... number of last files by date
                       If no args, then last 10

HDOC
)
	printf "%s\n" "${MSG}"
}

# === MAIN ===
unset CATEGORIES
readarray -t CATEGORIES < <(ls -1 "${KNWLGDB}")
noargs="true"

while getopts "hn:" arg; do
	case "${arg}" in
		h)
			usage
		;;

		n)
			num="${OPTARG}"
			for PTH in "${CATEGORIES[@]}"; do
				printf -- "%s\n" "--- ${KNWLGDB}/${PTH} ---"
				cd "${KNWLGDB}/${PTH}" && CMD2 | head -n "${num}"; done
		;;

		*)
			printf "[i] displaying last 10 files from all categories in: '%s'\n" "${KNWLGDB}"
			printf "[!] for more options/usage run with -h\n\n"
			for PTH in "${CATEGORIES[@]}"; do
				printf -- "%s\n" "--- ${KNWLGDB}/${PTH} ---"
				cd "${KNWLGDB}/${PTH}" && CMD2 | head -n 10
			done
		;;
	esac
	noargs="false"
done

if [[ "${noargs}" == "true" ]]; then
	printf "[i] displaying last 10 files from all categories in: '%s'\n" "${KNWLGDB}"
	printf -- "[!] or more options/usage run with -h!\n\n"
	for PTH in "${CATEGORIES[@]}"; do
		printf -- "%s\n" "--- ${KNWLGDB}/${PTH} ---"
		cd "${KNWLGDB}/${PTH}" && CMD2 | head -n10
	done
fi

printf "\n"

