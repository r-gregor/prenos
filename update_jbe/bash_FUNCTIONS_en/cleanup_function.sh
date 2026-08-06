
TMPD="./tmp"

# runs commands inside functions on exit or ctrl+c of script
cleanup() {
	printf "[INFO] removing temporary files and directories ...\n"
	rm -rfv ${TMPD}
}

trap cleanup EXIT

main() {
	...
}

main

