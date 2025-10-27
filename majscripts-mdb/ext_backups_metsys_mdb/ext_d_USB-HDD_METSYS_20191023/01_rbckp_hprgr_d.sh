#! /bin/bash

### Name:	01_rbckp_hprgr_d.sh
### Date:	20190207
### Decription:
###
### rsync backup /home/rgregor
###
### UPDATE 20171208: timestamp function
### --progress replaced with --info=misc2,stats2
###
### UPDATE 20180314
### --progress replaced with --info=misc2,stats2
### added timestamps and done in xxx sconds
###
### UPDATE 20191023
### NEW FOLDER STRUCTURE (NEW HDD)
### *********************************************************************************************************

# timestamp
function tms() {
    echo -n "[ $(date +%Y%m%d_%H%M%S) ] "
}


# new IFS --> newline
gr_oldifs=$IFS
IFS=$'\n'

# VARIABLES
gr_CURRDATE="$(date +%Y%m%d)"
gr_DANES="$(date +%Y%m%d)"
gr_CURRT="$(date +%Y%m%d_%H%M%S)"
gr_CURDRV=${PWD}

gr_0="$(realpath $0)"


# VARIABLES new 20170303
# UPDATED 20171208: --progress replaced with --info=misc2,stats2
# UPDATED 20180411: --info=name0,stats2,progress0; gr_FILT='\grep "files\|total"'
gr_RSDRO='sudo rsync -rltDn --progress '       # DRY-RUN options
gr_RSO='sudo rsync -rltD --no-links --info=name0,stats2,progress0 --modify-window=2'           # RUN backup ptions
gr_FILT='/bin/grep "files\|total"'

# EXPORTS
export gr_DRIVE=${gr_CURDRV}
export gr_BEKAPD=${gr_DRIVE}/bekaps_d
export gr_LOGF=${gr_BEKAPD}/bekap_d.log
export gr_DNBCKP=${gr_DRIVE}/d_METSYS/d_DONOTBACKUP.txt


# RUN ...
dT1=$(date +"%s")
(tms; echo "Starting ${gr_0} ... ") | tee -a "${gr_LOGF}"

### change 20190115
# read -p "Current Drive is: [ ${gr_CURDRV} ]. OK?"
tms; echo "Current Drive is: [ ${gr_CURDRV} ]."

tms; echo "log-file: ${gr_LOGF}"

### added 20190115
# check if bekaps directory exists
if [ ! -e "${gr_BEKAPD}" ]; then
    (tms; echo "Wrog DRIVE letter or there is no ${gr_BEKAPD}. Aborting ...") | tee -a "${gr_LOGF}"
	exit 1
fi

# check if --exclude-from file exists
if [ ! -e "${gr_DNBCKP}" ]; then
    (tms; echo "Wrog DRIVE letter or there is no ${gr_DNBCKP}. Aborting ...") | tee -a "${gr_LOGF}"
	exit 1
fi

### changed 20190115
# tms; echo "${gr_DNBCKP} exist. It is safe to continue ..."
tms; echo "${gr_BEKAPD} and ${gr_DNBCKP} exist. It is safe to continue ..."

cd "${gr_BEKAPD}"
tms; echo "Current directory is ${PWD} ..."
### changed 20190115
# read -p "Continue?"

# START

tms; echo "-----------------------------------------------------------------------------"
(tms; echo "Backing up /home/ to ${gr_BEKAPD} ...") | tee -a "${gr_LOGF}"
(tms; echo "Syncing ...  ") | tee -a ${gr_LOGF}
sudo rsync -rltD --no-links --info=name0,stats2,progress0 --modify-window=2 --delete --exclude-from=${gr_DNBCKP} /home/ ${gr_BEKAPD}/home/ | eval ${gr_FILT} | while read line; do (tms; echo $line); done
# sudo rsync -rltDn --no-links --progress --delete --exclude-from=${gr_DNBCKP} /home/ ${gr_BEKAPD}/home/ | eval ${gr_FILT} | while read line; do (tms; echo $line); done
(tms; echo "-----------------------------------------------------------------------------") | tee -a "${gr_LOGF}"

dT2=$(date +"%s")
(tms; echo "${gr_0} done in $((dT2-dT1)) seconds!") | tee -a  ${gr_LOGF}
(tms; echo "-----------------------------------------------------------------------------") | tee -a "${gr_LOGF}"
# tms; echo "============================================================================="
exit

# back to original IFS ...
IFS=${gr_OLDIFS}
