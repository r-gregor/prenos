#! /usr/bin/env bash
# fname: cleanup-on-exit.sh
# 20260805 v1
# last 20260805
# ---

TMPD="./tmp"

init() {
	if [ ! -d "${TMPD}" ]; then
		printf "[INFO] no './${TMPD}' directory, so creating one ...\n"
		printf "[INFO] "
		mkdir -v "${TMPD}"
	fi

	tmpstmp=$(date "+%Y%m%d-%H%M%S")
	fname="tmpf-${tmpstmp}.txt"

	printf "[INFO] creating temporary files ...\n"
	for N in $(seq 1 10); do
		fname=$(printf "tmpf-${tmpstmp}-%02d.txt" "${N}")
		touch ${TMPD}/${fname}
	done

}

cleanup() {
	printf "[INFO] removing temporary files and directories ...\n"
	rm -rfv ${TMPD}
}

trap cleanup EXIT

main() {
	init
	printf "[INFO] Checking for files in {TMPD} ...\n"
	ls -1 ${TMPD}/*

	# trap: runs ceanup even if we press CTRL+C
	printf -- "---\n[INFO] Press any key to continue, or CTRL+C to exit\n"
	read -p ""
}

main

