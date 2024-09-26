#! /bin/bash

### Name:   spremeni_geslo_en
### Author: RgregoR
### Date:   20240919
### Decription:
### Change psswd-num in config files for sending mail CLI
### UPDATE 20230523: conf data in ~/.SCRTS file

# path to .SCRTS
# gCurdir="$HOME/majstaf/majbin_en/send_mail_scrts/"
gScrts="$HOME/.SCRTS_en"

# path to temp backup files
gTempd="$HOME/.tmp"

if [[ ! -d $gTempd ]]; then
	echo "Error: There is no $gTempd/"
	echo
	exit 1
fi

# timestamp
function gTms() {
    echo -n "[ $(date +%Y%m%d_%H%M%S) ] "
}


gTms; echo "Starting $0"

# creating backup files
gTms; echo -n "Creating backupfiles ... "

# for gEnd in conf py; do
#     cp ${gCurdir}/send_config_en.${gEnd} ${gTempd}/send_config_en.${gEnd}_${gTms}.bckp 2> /dev/null
# done
cp ${gScrts} ${gTempd}/${gScrts}.bckp 2> /dev/null

echo "done"

# TEST for PSWD in config files
gTms; echo "Checking for 'number' in password ..."

function getNum() {
	num=$(grep 'PSSWD_SCRTS' ${gScrts} | grep -oE "[[:digit:]]{3}")
	echo $num
}

gOldn=$(getNum "conf")
NUM_O=$(getNum "py")
echo "Old passwd number: $NUM_O"

echo
gTms; read -p "Enter NEW passwd num: " gNewn

gTms; echo "Old passwd num is: ${gOldn}"
gTms; echo "NEW passwd num is: ${gNewn}"

# TEST for files
if [ -f ${gScrts} ]; then
    gTms; echo "Files exist. OK to continue ..."
else
    gTms; echo "NO config files! Quitting. Bye"
    exit 1
fi

gTms; read -p "Continue?"

# ACTION
gTms; echo "Replacing old psswd in send_config_en.*: "
sed -i "s/${gOldn}/${gNewn}/g" ${gScrts}
grep ${gNewn} ${gScrts}

