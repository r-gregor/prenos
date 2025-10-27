#! /usr/bin/env bash


# VARS
gr_FROM1="/home/rgregor/majfajls/coding/"
gr_TO1="/home/rgregor/Dropbox/ODPRTO/MCDN_d/"
gr_FROM2="/home/rgregor/java/"
gr_TO2="/home/rgregor/Dropbox/ODPRTO/home_username_java_d/"


# timestamp
function tms() {
    echo -n "[ $(date +%Y%m%d_%H%M%S) ] "
}

crtn=100
function crtc() {
    for ((i=1; i<=$1; i++)); do
        echo -n "-"
    done
    echo
}

# run
function runBackups() {
    tms; crtc $(($crtn-20))
    # tms; echo "syncing ..."
    tms; echo "from: ${gr_FROM1}"
    tms; echo "to:   ${gr_TO1}"
    # rsync -rltDv --delete --progress ${gr_FROM1} ${gr_TO1} |  grep -v '^[[:space:]]*$' | while read line; do (tms; echo $line); done
    rsync -rltDv --delete ${gr_FROM1} ${gr_TO1} |  grep -v '^[[:space:]]*$' | while read -r line; do echo $line | sed "s/.*/[ $(date +%Y%m%d_%H%M%S) ] rsync: & .../"; done
    tms; crtc $(($crtn-20))
    # tms; echo "syncing ..."
    tms; echo "from: ${gr_FROM2}"
    tms; echo "to:   ${gr_TO2}"
    # rsync -rltDv --delete --progress ${gr_FROM2} ${gr_TO2} | grep -v '^[[:space:]]*$' | while read line; do (tms; echo $line); done
    rsync -rltDv --delete ${gr_FROM2} ${gr_TO2} | grep -v '^[[:space:]]*$' | while read -r line; do echo $line | sed "s/.*/[ $(date +%Y%m%d_%H%M%S) ] rsync: & .../"; done
    tms; crtc $(($crtn-20))
}

# main
dT1=$(date +"%s")
tms; echo "Starting $0"
tms; echo "Syncing ..."
runBackups
dT2=$(date +"%s")
tms; echo "Done in $((dT2-dT1)) seconds!"
crtc $crtn
