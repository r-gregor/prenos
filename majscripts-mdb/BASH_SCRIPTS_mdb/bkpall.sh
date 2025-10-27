
#! /bin/bash

### Name:	bkpall.sh
### Author:	RgregoR
### Date:	20150401
### Decription:	Start all backup scripts one after another ...
### 		(It replaces bkpall alias!)
###
### UPDATE 20181106: remove bekap2 ... (cp bckp to Dropbox)

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


tms; echo "Starting $0 ..."
tms; crtc $(($crtn-20))

BINPATH=/home/rgregor/majfajls/coding/00_ukazi

# $BINPATH/bekap1-d-lh.sh && $BINPATH/bekap2-d-lh-db.sh && $BINPATH/bekap3-d-db-lh.sh
$BINPATH/bekap1-d-lh.sh && $BINPATH/bekap3-d-db-lh.sh
