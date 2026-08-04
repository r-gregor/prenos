#! /usr/bin/env bash
# from: Can you write `md5` in Pure Bash? (100% bash, no external tools)
#       https://www.youtube.com/watch?v=VDQmu6KzDvU
#       14:44 - 18:53 / 01:28:73
# fname: read-chunks.sh
# 20260804 v1
# last 20260814
# ---

read_lines() {
	while IFS= read -r LINE; do
		printf "[ ${LINE} ]\n"
	done
}

read_lines "$@"

# test command:
# choaks on null '\0' character
# $> printf "one\ntwo\nthree\0four\0five\0" | ./read-lines.sh
# [ one ]
# [ two ]

