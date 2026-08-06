# Usage:
# print_delim_line "-" 80
print_delim_line() {
	local char="-"
	local num=3

	if [ $# -ne 2 ]; then
		:
	else
		char="$1"
		num="$2"
	fi

	printf "%.0s${char}" $(seq 1 ${num})
}

