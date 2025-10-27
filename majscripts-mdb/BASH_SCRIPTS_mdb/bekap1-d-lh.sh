#!/bin/bash

### ------------------------------------------------------------------------
### name:       bckpd.V4.sh
### author:     RgregoR
### date:       september 2013 / updated 20150326 / 20150414 / 20150526
###             updated 20180527 (added $HOME/RUT)
### ------------------------------------------------------------------------
### Description:
### script that creates gzipped tar backup of $HOME/* files
### and /home/forallusers/*
### 1 - checks if at destination folder  is an existing arcive and delets it
### 2 - creates the archive in the destination folder
###
### ------------------------------------------------------------------------

# *************************************************************
# VARIABLES
# =========


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

# source folder:
gr_FROMCDNG=$HOME/majfajls/coding

# _FROMBRC=$HOME/.[a-zA-Z0-9]*
# _FROMBRC=$(find $HOME/ -maxdepth 1 -type f -iname '.*')
gr_FROMBRC="$HOME/.[hidden files]"
gr_FROMSZN=$HOME/majfajls/SEZNAMI
gr_FROMMTSS=$HOME/majfajls/METSYS_xubuntu_18-04
# gr_FROMRUT=$HOME/majfajls/RUT

# destination folder
# !!! PAZI-  POT ZA ARHIVO !!!
gr_TOF=/home/rgregor/majfajls/bckps_all/bckp_hp_rgregor
gr_LOG=/home/rgregor/majfajls/bckps_all/bckp.log


# datestamp:
gr_DATE=$(date +%Y%m%d_%H%M%S)

# archive:
gr_CURRCDNG="bckp_cdng_d_${gr_DATE}.tar.gz"
# _CURRDOCS="bckpdocs-en_${gr_DATE}.tar.gz"
gr_CURRFAU="bckp_fau_d_${gr_DATE}.tar.gz"
gr_CURRSZN="bckp_szn_d_${gr_DATE}.tar.gz"
gr_CURRBRC="bckp_brc_d_${gr_DATE}.tar"
gr_CURRDOMA="bckp-doma_d_${gr_DATE}.tar.gz"
gr_CURRMTSS="bckp_mtss_d_${gr_DATE}.tar.gz"
# gr_CURRRUT="bckprut_d_${gr_DATE}.tar.gz"


# TEST if archive file exists:
if [ "$(ls -A ${gr_TOF})" ]; then
	tms; echo "${gr_TOF}/ is NOT empty!"
	# Ask for confirmation:
	# read -p "Press any key to REMOVE files or [ctrl+c] to quit"
	tms; echo "Removing files from ${gr_TOF}/ ... "
	rm -v ${gr_TOF}/* | grep -v '^[[:space:]]*$' | while read line; do (tms; echo $line); done
	tms; echo "[OK]"
else
	tms; echo "${gr_TOF}/ is empty ..."
fi

# creating an archive:
tms; echo -n "Creating archive: ${gr_TOF}/${gr_CURRCDNG} ... "
# tar -czf ${gr_TOF}/${gr_CURRCDNG} ${gr_FROMCDNG}/*
tar -czf ${gr_TOF}/${gr_CURRCDNG} -C ${HOME}/majfajls coding
echo "[OK]"

# echo "Creating archive: ${gr_TOF}/${gr_CURRDOCS} ... "
# tar -czf ${gr_TOF}/${gr_CURRDOCS} ${gr_FROMDOCS}/*
# echo

tms; echo -n "Creating archive: ${gr_TOF}/${gr_CURRFAU} ... "
# tar -czf ${gr_TOF}/${gr_CURRFAU} ${gr_FROMFAU}/*
tar -czf ${gr_TOF}/${gr_CURRFAU} -C /home forallusers
echo "[OK]"

tms; echo -n "Creating archive: ${gr_TOF}/${gr_CURRSZN} ... "
tar -czf ${gr_TOF}/${gr_CURRSZN} -C ${HOME}/majfajls SEZNAMI
echo "[OK]"

# echo -n "Creating archive: ${gr_TOF}/${gr_CURRDOMA} ... "
# tar -czf ${gr_TOF}/${gr_CURRDOMA} -C ${HOME}/majfajls/RUT/home rgregor
# echo "[OK]"

tms; echo -n "Creating archive: ${gr_TOF}/${gr_CURRMTSS} ... "
tar -czf ${gr_TOF}/${gr_CURRMTSS} -C ${HOME}/majfajls METSYS_xubuntu_18-04
echo "[OK]"


# tms; echo -n "Creating archive: ${gr_TOF}/${gr_CURRRUT} ... "
# tar -czf ${gr_TOF}/${gr_CURRRUT} -C ${HOME}/majfajls RUT
# echo "[OK]"


tms; echo -n "Creating archive: ${gr_TOF}/${gr_CURRBRC} ... "
# tar -czf ${gr_TOF}/${gr_CURRBRC} ${gr_FROMBRC}
# cd $HOME && sudo find -maxdepth 1 -type f -iname "\.*" | tar -cf ${gr_TOF}/${gr_CURRBRC} -T -
cd $HOME && find -maxdepth 1 -type f -iname "\.*" | tar -cf ${gr_TOF}/${gr_CURRBRC} -T -
cd $HOME && tar -rf ${gr_TOF}/${gr_CURRBRC} -C ${HOME} ".alseg/"
gzip ${gr_TOF}/${gr_CURRBRC}
echo "[OK]"

(tms; echo "successfully backed up CODING, FAU, SZN, MTSS and BRC archives to ${gr_TOF}/") | tee -a ${gr_LOG} # append to log
tms; echo "DONE!"
crtc $crtn