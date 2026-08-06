
usage() {
	printf "\n\tUsage: filename-string-adjustment-function \"<filename string with spaces inside quotes>\"\n\n"
}


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

# Usage:
printout=$(filename_string_adjustmen "${1}")
printf "${printout}\n"

