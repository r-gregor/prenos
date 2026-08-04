#! /usr/bin/env bash
# from: Can you write `md5` in Pure Bash? (100% bash, no external tools)
#       https://www.youtube.com/watch?v=VDQmu6KzDvU
#       14:44 - 18:53 / 01:28:73
# fname: read-chunks-updated.sh
# 20260804 v1
# last 20260814
# ---

read_chunks_good_updated() {
	while true; do
		IFS= read -r -d '' -n 4096 CHUNK
		code=$?
		n="${#CHUNK}"

		printf "read ${n} bytes: [ ${CHUNK} ]\n" # if 'read' fails this last still prints

		# 'read' failed - so we are done proccessing
		if ((code != 0)); then
			break
		fi
	done
}

read_chunks_good_updated "$@"

