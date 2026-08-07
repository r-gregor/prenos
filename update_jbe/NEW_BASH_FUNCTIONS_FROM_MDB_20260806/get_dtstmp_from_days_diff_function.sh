
usage_get_dtstmp() {
	printf "\n\tUSAGE: get_dtstmp_from_days_diff <days difference> <custom datestamp[optional]>\n\n"
}

test_print() {
	# check if env var TESTING is set:
	if [[ -n $TESTING ]]; then
		printf "[TEST] "
		printf "$@"
	fi
	return 0
}

info_print() {
	printf "[INFO] "
	printf "$@"
	return 0
}

err_print() {
	printf "[ERROR] "
	printf "$@"
	return 0
}

get_dtstmp_from_days_diff() {
	unset dtstmp_curr
	unset days_diff

	if [ $# -eq 1 ]; then
		local days_diff="$1"
		local dtstmp_curr=$(date "+%Y%m%d")
	elif [ $# -eq 2 ]; then
		local days_diff="$1"
		local dtstmp_curr="$2"
	else
		usage_get_dtstmp
		exit 1
	fi

	declare -a month_days=(0 31 28 31 30 31 30 31 31 30 31 30 31)

	declare -A dtarr_curr=()
	declare -A dtarr_final=()

	dtarr_curr[yr]=$(echo ${dtstmp_curr:0:4} | sed 's/^0*//')
	dtarr_curr[mn]=$(echo ${dtstmp_curr:4:2} | sed 's/^0*//')
	dtarr_curr[dy]=$(echo ${dtstmp_curr:6:2} | sed 's/^0*//')


	info_print -- "---\n"
	info_print "number of days to go back: %d\n" ${days_diff}
	info_print "current datestamp:         %02d-%02d-%02d\n" ${dtarr_curr[dy]} ${dtarr_curr[mn]} ${dtarr_curr[yr]}

	days_in_curryear=${dtarr_curr[dy]}
	if [ ${dtarr_curr[mn]} -gt 1 ]; then
		for NMN in $(seq 1 $(( ${dtarr_curr[mn]} - 1 )) ); do
			days_in_curryear=$(( ${days_in_curryear} + ${month_days[${NMN}]} ))
		done
	fi
	test_print "days from beginningi of\n"
	test_print "... this year till today:  %d\n" ${days_in_curryear}

	if [ ${days_diff} -ge ${days_in_curryear} ]; then
		err_print "days difference is greater or equal to days left in current year\n\n"
		exit 1
	fi

	if [ ${days_diff} -gt ${dtarr_curr[dy]} ]; then
		test_print "Days difference %d bigger than curren day in month %d\n" ${days_diff} ${dtarr_curr[dy]}
		days_left=$(( ${days_diff} - ${dtarr_curr[dy]} ))
		dtarr_final[mn]=$(( ${dtarr_curr[mn]} - 1 ))
		while [ ${days_left} -gt ${month_days[${dtarr_final[mn]}]} ]; do
			dtarr_final[mn]=$(( ${dtarr_final[mn]} - 1 ))
			days_left=$(( ${days_left} - ${month_days[${dtarr_final[mn]}]} ))
		done
		dtarr_final[dy]=$(( ${month_days[${dtarr_final[mn]}]} - ${days_left} ))
		dtarr_final[yr]=${dtarr_curr[yr]}
	else
		dtarr_final[mn]=${dtarr_curr[mn]}
		dtarr_final[dy]=$(( ${dtarr_curr[dy]} - ${days_diff} ))
		dtarr_final[yr]=${dtarr_curr[yr]}
	fi

	info_print "final datestamp:           %02d-%02d-%02d\n" ${dtarr_final[dy]} ${dtarr_final[mn]} ${dtarr_final[yr]}

	printf "\n"
}

# USAGE in MAIN:
get_dtstmp_from_days_diff "$@"

