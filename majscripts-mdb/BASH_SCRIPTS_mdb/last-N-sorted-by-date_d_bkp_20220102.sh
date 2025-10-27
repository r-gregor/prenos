#! /usr/bin/env bash

### Name:	Scriptname ...
### Author:	Author ... 
### Date:	 
### Decription:
### 
### 
### 

## CMD1=/usr/local/bin/sort-files-by-end-date
CMD1=/usr/local/bin/rsort-by-enddate_g
DRPBO_d=/home/rgregor/Dropbox/ODPRTO

function usage() {
MSG=$(cat << HDOC

Usage: $0 [args]
	args:	-h ... help
		-n ... number of last files by date

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
			for PTH in $(\ls -d ${DRPBO_d}/_{PYTHON,JAVA,TXT,GO,C_and_Cpp}); do
				echo "--- ${PTH} ---"
				cd ${PTH} && ${CMD1} | head -n ${num}; done
		;;

		*)
			echo "Displaying last 10 files from ${DRPBO_d}/_{PYTHON,JAVA,TXT,GO}"
			echo "For more options/usage run with -h!"
			echo ""
			for PTH in $(\ls -d ${DRPBO_d}/_{PYTHON,JAVA,TXT,GO}); do
				echo "--- ${PTH} ---"
				cd ${PTH} && ${CMD1} | head -n10; done
		;;
	esac
	noargs="false"
done


if [[ ${noargs} == "true" ]]; then
	echo "Displaying last 10 files from ${DRPBO_d}/_{PYTHON,JAVA,TXT,GO}"
	echo "For more options/usage run with -h!"
	echo ""
	for PTH in $(\ls -d ${DRPBO_d}/_{PYTHON,JAVA,TXT,GO}); do
		echo "--- ${PTH} ---"
		cd ${PTH} && ${CMD1} | head -n10; done
fi

