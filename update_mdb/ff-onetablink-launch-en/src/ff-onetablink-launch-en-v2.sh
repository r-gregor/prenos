#! /usr/bin/env bash
# fname: src/ff-onetablink-launch-en-v2.sh
# v1_20260529 converts a line:
#             https://www.youtube.com/results?search_query=salsa+hand+toss+flip | (7) salsa hand toss flip - YouTube
#             ... to ...
#             https://www.youtube.com/results?search_query=salsa+hand+toss+flip;salsa hand toss flip
# v2_20260529 output into array
# last 20260529
# ---

# globals
FFCMD_EN=/c/Users/gregor.redelonghi/majstaf_en/majprogs_en/FireFox_63.0.1/FirefoxPortable.exe
SRCDIR="$(dirname $(realpath ${BASH_SOURCE[0]}))"
FZFCMD_EN="fzf -e --reverse" # cygwin version does not support --width option

unset llist
declare -a llist

usage() {
	cat <<"EOF"
	Usage: convert-onetab-to-csv <filename>

EOF
}

if [ $# -ne 1 ]; then
	usage
	exit
else
	fjl=$1
	if [ ! -f "${fjl}" ]; then
		printf "%s\n\n" "[ERROR] No such file: ${fjl}"
		exit
	fi
fi

while IFS= read LINE; do
	if [ "${#LINE}" -lt 2 ]; then
		continue
	fi
	llist+=("$(echo $LINE | sed -e 's/\([^ ]\+\) | \(.*\)/\1;\2/' -e 's/([[:digit:]]\+) //' -e '/\S/!d'  -e 's/ - YouTube//')")
done < "${fjl}"

selection=$(for lnk in "${llist[@]}"; do
	echo ${lnk}
done | ${FZFCMD_EN})

cygstart ${FFCMD_EN} "${selection%%;*}"

printf "\n"

