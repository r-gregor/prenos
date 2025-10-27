#! /usr/bin/env bash
# mdbgt_testpush
# last change: 20240821

HST="mdb"
# COLOR_SET="\e[1;94m"
# COLOR_SET="\e[1;34m"
COLOR_SET="\e[1;38;5;75m"
COLOR_RESET="\e[0m"
DEST=${HOME}/majstaf/${HST}git/
STTS=${TMP}/${HST}git_status
RPRT=${TMP}/${HST}git_report
> ${STTS}
> ${RPRT}

CURRDIR=$PWD
cd ${DEST}
for DDD in $(find * -maxdepth 0 -type d); do
	echo ""
	printf "${COLOR_SET}"
	echo "*** git testpush in ${DDD} ... ***"
	printf "${COLOR_RESET}"
	cd $DDD &>/dev/null && ~/.local/bin/ghgl_testpush_${HST} | tee -a ${STTS}
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

