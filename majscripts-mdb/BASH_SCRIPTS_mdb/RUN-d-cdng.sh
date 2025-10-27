#! /usr/bin/env bash


# VARS
gr_FROM1="$HOME/majstaf"
gr_TO1="$HOME/Dropbox/ODPRTO/MCDN_d"
gr_FROM2="$HOME/majstaf/java"
gr_TO2="$HOME/Dropbox/ODPRTO/home_username_java_d"

# timestamp
function tms() {
    echo -n "[ $(date +%Y%m%d_%H%M%S) ] "
}

crtcn=3

function crtc() {
    for ((i=1; i<=$1; i++)); do
        echo -n "-"
    done
    echo
}

# command
CMD="rsync -rltDv --delete"

function mcdn_d() {
	myDir="$1"
	mySrc="${gr_FROM1}/${myDir}"
	myDest="${gr_TO1}/${myDir}"
    	tms; echo "from: ${mySrc}"
    	tms; echo "to:   ${myDest}"
	# read -p "Continue?"
	# ${CMD} ${mySrc}/ ${myDest}/ | while read line; do if [[ $line != "" ]]; then (tms; echo $line); fi; done
	${CMD} ${mySrc}/ ${myDest}/ | grep -v '^[[:space:]]*$' | while read -r line; do echo $line | sed "s/.*/[ $(date +%Y%m%d_%H%M%S) ] rsync: &/"; done
}

# run
function runBackups() {
    for gr_DIR in majbin coding; do
		mcdn_d ${gr_DIR}
    tms; crtc ${crtcn}
    done    
}

# main
dT1=$(date +"%s")
tms; echo "Started: $0"
tms; echo "Syncing ..."
tms; crtc ${crtcn}
runBackups
dT2=$(date +"%s")
tms; echo "Done in $((dT2-dT1)) seconds!"
tms; crtc ${crtcn}

