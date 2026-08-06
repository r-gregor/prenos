
# choaks on string with no trailing '\0'
read_chunks_bad() {
	while IFS= read -r -d '' CHUNK; do
		printf "[ ${CHUNK} ]\n"
	done
	# if there is no trailing '\0'
	echo "(loop has ended)"
	echo "this is left over: $CHUNK"
}

# FIX
read_chunks_good() {
	while true; do
		IFS= read -r -d '' CHUNK
		code=$?

		printf "[ ${CHUNK} ]\n" # if 'read' fails this last still prints

		# 'read' failed - so we are done proccessing
		if ((code != 0)); then
			break
		fi
	done
}

# Usage:
# read_chunks_bad "$@"
# read_chunks_good "$@"

