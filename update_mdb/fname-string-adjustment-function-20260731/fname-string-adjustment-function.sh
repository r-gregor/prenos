#! /usr/bin/env bash
# fname: fname-string-adjustment-function.sh
# v1_20260731
# v2_20260731: rearrange into function
# last 20260731
# ---

unset fname_str
unset fname_final
unset fname_str_updated

usage() {
	printf "\n\tUsage: filename-string-adjustment-function \"<filename string with spaces inside quotes>\"\n\n"
}

if [ $# -ne 1 ]; then
	usage
	exit 1
fi

filename_string_adjustmen() {
	today=$(date +"%Y%m%d")
	fname_str="$1"
	fname_str_updated=$(echo "${fname_str}" | \
		sed "s/[:]\+//" | \
		sed "s/[;]\+//" | \
		sed "s/[.]\+//" | \
		sed "s/[,]\+//" | \
		sed "s/[?]\+//" | \
		sed "s/[@]\+//" | \
		tr '[[:upper:]]' '[[:lower:]]' | \
		sed "s/  */-/g" | \
		sed "s/_\{2,\}/-/g" | \
		sed "s/-\{2,\}/-/g"
	)

	printf "${fname_str_updated}-${today}.txt"
}

printout=$(filename_string_adjustmen "${1}")
printf "${printout}\n"

