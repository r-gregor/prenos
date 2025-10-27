#! /bin/bash

### scritp to check weather DROPBOX directory is present
### and copies over bckps-es.


# timestamp
function tms() {
    echo -n "[ $(date +%Y%m%d_%H%M%S) ] "
}


echo -e "\n---"
tms; echo "Starting $0 ..."

# variables initiation ...
gr_SRCDIR="/home/rgregor/majfajls/bckps_all/bckp_hp_rgregor"
gr_DESTDIR="$HOME/Dropbox/ODPRTO/bckp_hp_rgregor_doma"
gr_LOG=/home/rgregor/majfajls/bckps_all/bckp.log

tms; echo "Removing old files from ${gr_DESTDIR} ... "
rm -v ${gr_DESTDIR}/* | grep -v '^[[:space:]]*$' | while read line; do (tms; echo $line); done
tms; echo "[OK]"

# Copying over bckp files ...
tms; echo "Copying over bckps files ... "
cp -v ${gr_SRCDIR}/* ${gr_DESTDIR}/
tms; echo "[OK]"

(tms; echo "successfully copied CDNG, FAU, SZN, MTSS and BRC archives to ${gr_DESTDIR}/") | tee -a ${gr_LOG} # append to log
tms; echo "DONE!"
