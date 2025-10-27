#! /usr/bin/env bash
# ghgl_testpush_mdb
# last change: 20240821

rmts=( $(git remote) )

COLOR_RED="\e[1;92m"
COLOR_RESET="\e[0m"
pgs=2

for rmt in "${rmts[@]}"
do
	echo -n "[INFO] git testpush in: $(git remote get-url ${rmt}) ..."
	/usr/bin/git push --dry-run ${rmt} main &> status
	grep 'reject\|pull' status > /dev/null
	if [[ $? -eq 0 ]]; then
		printf " ${COLOR_RED} NEED TO PULL FROM REMOTE\n"
		printf "${COLOR_RESET}"
		#cat status
		rm status > /dev/null
		if [ $pgs -eq 1 ]; then
			echo -e "---"
		fi
		pgs=2
	else
		echo " no action required"
		rm status > /dev/null
	fi
done

