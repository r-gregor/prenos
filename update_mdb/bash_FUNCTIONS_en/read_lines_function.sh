
read_lines() {
	while IFS= read -r LINE; do
		printf "[ ${LINE} ]\n"
	done
}

# Usage:
read_lines "$@"

