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

# run
function runBackups() {
    tms; echo "----------------------------------------------------------------------"
    # tms; echo "syncing ..."
    tms; echo "from: ${gr_FROM1}"
    tms; echo "to:   ${gr_TO1}"
    rsync -rltDv --delete --progress ${gr_FROM1} ${gr_TO1} | while read line; do if [[ $line != "" ]]; then (tms; echo $line); fi; done
    tms; echo "----------------------------------------------------------------------"
    # tms; echo "syncing ..."
    tms; echo "from: ${gr_FROM2}"
    tms; echo "to:   ${gr_TO2}"
    rsync -rltDv --delete --progress ${gr_FROM2} ${gr_TO2} | while read line; do if [[ $line != "" ]]; then (tms; echo $line); fi; done
    tms; echo "----------------------------------------------------------------------"
}

# main
tms; echo "Starting $0"
tms; echo "Syncing ..."
runBackups
tms; echo "Done!"
