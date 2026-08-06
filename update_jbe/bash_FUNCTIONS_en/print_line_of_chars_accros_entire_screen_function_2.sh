
print_delim_line_across() {
	local char="-"

	if [ $# -ne 1 ]; then
		:
	else
		char="$1"
	fi

	printf "%.0s${char}" $(seq 1 $(tput cols))
}

# Usage:
print_delim_lina_across "="
