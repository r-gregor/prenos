#! /usr/bin/env bash
# fname: lsth-upgraded-20260126.sh
# 20260126 en: added optarfg for path and number
# last: 20260126
# ---

NUM=15
DEST="."

while getopts 'p:n:' opt; do
	case "${opt}" in
		p) DEST="${OPTARG}";;
		n) NUM="${OPTARG}";;
	esac
done

/usr/bin/ls --color=always -t "${DEST}" | head -n "${NUM}"

