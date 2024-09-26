#! /usr/bin/env bash

### updated 20220202:
###    added ${DEST1}, and ${DEST2}
###    changed for loop
### -------------------------------
###

CMD1=${HOME}/.local/bin/sort-files-by-end-date
CMD2=${HOME}/.local/bin/rsort-by-tmstmp_c
# DRPBO=/c/Users/gregor.redelonghi/majstaf_en/drpbx-en/ODPRTO
DRPBO=/home/gregor.redelonghi/majstaf_en/engit/knowledgedb
DEST1="C_and_Cpp,PYTHON,JAVA,CS_and_other_PL,GIT,VIM,RUST,LINUX_SYSTEM,TXT,GO"
DEST2="C_and_Cpp PYTHON JAVA CS_and_other_PL GIT VIM RUST LINUX_SYSTEM TXT GO"


function usage() {
MSG=$(cat << HDOC

Usage: $0 [args]
    args:
        -h        ... help
        -n <num>  ... number of last files by date
        
        If no args, then last 10


HDOC
)
	echo "${MSG}"
}

noargs="true"

while getopts "hn:" arg; do
	case ${arg} in
		h)
			usage
		;;

		n)
			num=${OPTARG}
			for PTH in ${DEST2}; do
				echo "--- ${DRPBO}/_${PTH} ---"
				cd ${DRPBO}/_${PTH} && ${CMD2} | head -n ${num}; done
		;;

		*)
			echo "Displaying last 10 files from ${DRPBO}/_{"${DEST1}"}"
			echo "For more options/usage run with -h!"
			echo ""
			for PTH in ${DEST2}; do
				echo "--- ${DRPBO}/_${PTH} ---"
				cd ${DRPBO}/_${PTH} && ${CMD2} | head -n10; done
		;;
	esac
	noargs="false"
done


if [[ ${noargs} == "true" ]]; then
	echo "Displaying last 10 files from ${DRPBO}/_{"${DEST1}"}"
	echo "For more options/usage run with -h!"
	echo ""
	for PTH in ${DEST2}; do
		echo "--- ${DRPBO}/_${PTH} ---"
		cd ${DRPBO}/_${PTH} && ${CMD2} | head -n10; done
fi

