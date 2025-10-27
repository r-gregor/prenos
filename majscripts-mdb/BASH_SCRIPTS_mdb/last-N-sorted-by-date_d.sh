#! /usr/bin/env bash

### updated 20240516
###    changed source dirs
### -------------------------------
###


CMD1=~/.local/bin/rsort-by-enddate_g
CMD2=~/.local/bin/rsort-by-tmstmp_c
DRPBO_d=/home/rgregor/majstaf/mdbgit/knowledgedb

# list of all:
# _AWK_SED, _BASH, _C_and_Cpp, _CS_and_other_PL, _Cygwin, _DOCKER, _GIT, _GO, _JAVA, _JS, _LINUX_SYSTEM, \
# _PYTHON, _RPi, _RUST, _TMUX, _TXT, _VIM,

DEST1="C_and_Cpp,JAVA,PYTHON,CS_and_other_PL,GIT,VIM,DOCKER,LINUX_SYSTEM,BASH,TXT"
DEST2="C_and_Cpp JAVA PYTHON CS_and_other_PL GIT VIM DOCKER LINUX_SYSTEM BASH TXT"

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
			for PTH in ${DEST2}; do
				echo "--- ${DRPBO_d}/_${PTH} ---"
				cd ${DRPBO_d}/_${PTH} && ${CMD2} | head -n ${num}; done
		;;

		*)
			echo "Displaying last 10 files from ${DRPBO_d}/_{"${DEST1}"}"
			echo "For more options/usage run with -h!"
			echo ""
			for PTH in ${DEST2}; do
				echo "--- ${DRPBO_d}/_${PTH} ---"
				cd ${DRPBO_d}/_${PTH} && ${CMD2} | head -n10; done
		;;
	esac
	noargs="false"
done


if [[ ${noargs} == "true" ]]; then
	echo "Displaying last 10 files from ${DRPBO_d}/_{"${DEST1}"}"
	echo "For more options/usage run with -h!"
	echo ""
	for PTH in ${DEST2}; do
		echo "--- ${DRPBO_d}/_${PTH} ---"
		cd ${DRPBO_d}/_${PTH} && ${CMD2} | head -n10; done
fi

