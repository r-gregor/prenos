#! /usr/bin/env bash
# testing_ghgl_testpush_mdb
# last change: 20240601

# COLOR_SET="\e[1;94m"
COLOR_SET="\e[1;38;5;75m"
COLOR_RESET="\e[0m"
USR="mdb"
DEST=${HOME}/majstaf/coding2/testing
STTS=${TMP}/${USR}_testing_status
RPRT=${TMP}/${USR}_testing_report
> ${STTS}
> ${RPRT}

CURRDIR=$PWD
cd ${DEST}
for DDD in $(ls -d *); do
	echo ""
	printf "${COLOR_SET}"
	echo "*** git testpush in ${DDD} ... ***"
	printf "${COLOR_RESET}"
	cd $DDD &>/dev/null && ${HOME}/.local/bin/ghgl_testpush_${USR} | tee -a ${STTS}
	grep -i 'pull' ${STTS} > /dev/null
	if [[ $? -eq 0 ]]; then
		echo -e "[INFO] git testpush in: ${DDD} ... NEED TO PULL FROM REMOTE\n" >> ${RPRT}
	fi
	> ${STTS}
	cd ..
done

echo ""
printf "${COLOR_SET}"
echo "*** REPORT ***"
printf "${COLOR_RESET}"
if [ -s ${RPRT} ]; then
	cat ${RPRT}
else
	echo "[INFO] No action required"
fi
rm ${RPRT} ${STTS} 2>/dev/null

cd ${CURRDIR}

