#! /usr/bin/env bash
# fname: bash-parse-opts-fname-as-last-opt-20260810-en.sh
# 20260810 v1 test getopt with shifting options
# last: 20260810
# ---

main() {
	local OPTIND OPTARG opt

	while getopts 'df' opt; do
		case "$opt" in
			d)
				printf "[INFO] parsing a dirname: "
				;;
			f)
				printf "[INFO] parsing a filename: "
				;;
			*)
				printf "[ERROR] no options supplied\n\n"
				exit 1
		esac
	done

	shift "$(( OPTIND - 1 ))"

	local fname="$1"

	if [[ -n $fname ]]; then
		printf "${fname}\n\n"
	else
		printf "[ERROR] no fname/dirname supplied\n\n"
		exit 1
	fi

return 0
}

#MAIN
main "$@"

