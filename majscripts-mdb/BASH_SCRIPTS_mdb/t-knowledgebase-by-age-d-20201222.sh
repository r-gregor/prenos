#! /usr/bin/env bash

### Name:	Scriptname ...
### Author:	Author ... 
### Date:	 
### Decription:
### 
### 
### 
 
# gWinPth="/c/Users/gregor.redelonghi"	# en
gDrpbxPth="${HOME}/Dropbox"
gOdprt="${gDrpbxPth}/ODPRTO"
gPtn="${gOdprt}/_PYTHON"
gTxt="${gOdprt}/_TXT"
gJava="${gOdprt}/_JAVA"
gTmpLst="$HOME/.tmp/list.txt"
gDaysDiff=0
gToday=$(date +%Y%m%d)



function usage() {
cat <<EOF
	Usage:
	$0 [arg]
	- arg: integer: number of days back from today
	
EOF
}

# timestamp
function tms() {
    echo -n "[ $(date +%Y%m%d_%H%M%S) ] "
}


function fillDatabase() {
	# minNum=$((${gToday}-${gDaysDiff}))
	lpath=$1
	# for FFF in $(\ls -1 ${lpath}); do
	for FFF in $(find ${gTxt}/* -regextype egrep -iregex ".*[^0-9][0-9]{8}\.txt"); do
		numpart=$(echo $FFF | sed 's/\(.*\)\([[:digit:]]\{8\}\).*/\2/')
		if [[ $numpart -ge $minNum ]]; then
			echo "$numpart $FFF" # >> ${gTmpLst}
		fi; done
}


# MAIN
tms; echo "Starting: $0"

# check for number of parameters to bash command
if [[ ! $# -eq 1 ]]; then
	tms; echo "No argument!"
	usage
	exit 1
else
	gDaysDiff=$1
		# echo $gDaysDiff 	# test
		# echo $gToday		# test
	minNum=$((${gToday}-${gDaysDiff}))
		# echo $minNum		# test
	tms; echo "Displaying files from: ${gTxt} newer than: $minNum"
	fillDatabase ${gTxt} | sort -nr
fi

