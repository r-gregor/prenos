#! /usr/bin/env bash
# fname: list-new-files-from-n-days-from-today.sh
# v1_20260731
# last 20260731
# ---

usage() {
	printf "\n\tUsage: list-new-files-from-n-days-from-today <days differenc to go back from today>\n\n"
}


YR=$(date "+%Y")
MN=$(date "+%m")
DY=$(date "+%d")

if [ $# -ne 1 ]; then
	usage
	printf "\n"
	exit 1
else
	ddiff=${1}
fi

newd=$((DY - ddiff))

if [ $newd -le 0 ]; then
	printf "[ERROR] The days difference is to big\n"
	exit 1
fi

newdate=${YR}${MN}${newd}

# -newermt: m - modification time
# -newerBt: B - birth time
# -newerct: c - inode change time
find ${HOME}/* \( \
	   -path $HOME/**/.git \
	-o -path $HOME/**/.cache \
	-o -path $HOME/**/.mnt \
	-o -path $HOME/**/engit \
	-o -path $HOME/**/mozilla \) \
-prune -o -newerct "${newdate}" -type f -print

