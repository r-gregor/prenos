#! /usr/bin/env bash
# from: Can you write `md5` in Pure Bash? (100% bash, no external tools)
#       https://www.youtube.com/watch?v=VDQmu6KzDvU
#       14:44 - 18:53 / 01:28:73
# fname: read-chunks.sh
# 20260804 v1
# last 20260814
# ---

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

# read_chunks_bad "$@"
read_chunks_good "$@"

# WITH read_chunks_bad()
#test command with trailing '\0':
# $> printf "one\ntwo\nthree\0four\0five\0" | ./read-chunks.sh
# [ one
# two
# three ]
# [ four ]
# [ five ]
# (loop has ended)
# this is left over:

# test command WITHOUT trailing '\0'
# $> printf "one\ntwo\nthree\0four\0five" | ./read-chunks.sh
# [ one
# two
# three ]
# [ four ]
# (loop has ended)
# this is left over: five

# ---

# WITH read_chunks_good()
#test command with trailing '\0':
# $> printf "one\ntwo\nthree\0four\0five\0" | ./read-chunks.sh
# [ one
# two
# three ]
# [ four ]
# [ five ]
# [  ] # !!! -- but is not problem (usually)

# test command WITHOUT trailing '\0'
# $> printf "one\ntwo\nthree\0four\0five" | ./read-chunks.sh
# [ one
# two
# three ]
# [ four ]
# [ five ]
