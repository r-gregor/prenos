#! /bin/bash

### Name:	update_checkout_weblinks.sh
### Author:	RgregoR
### Date:	20150420
### Decription:	updates checkout_weblinks_*.html to checkout_weblinks_$CURDATE.html with
### 		contents from checkout_weblinks_$CURDATE.txt
### 
### 

# ---
export DOMA="/home/rgregor/majfajls"


# ---
# clear the screen:
clear


# ---
# starting ...
echo -e "---\n[ $(date +%Y%m%d-%H%M%S) ] starting \"$0\" ..."


#---
# current date in YYYYmmdd format:
gr_CURD="$(date +%Y%m%d)"


# ---
# put source and destination locations in variables:
gr_SZN="$DOMA/SEZNAMI"
gr_TMP="$DOMA/.tmp"

echo
printf "%-30s %s\n" "seznami-loc:" "$gr_SZN"
printf "%-30s %s\n" "tmp-loc:" "$gr_TMP"

# ---
# create text and html files with current date and put them into variables:
gr_FJLTN=checkout_weblinks_${gr_CURD}.txt
gr_FJLHN=checkout_weblinks_${gr_CURD}.html

# ---
# check if ${gr_FJLTN} exist. If not abort: 

if [ ! -f ${gr_SZN}/${gr_FJLTN} ]; then
	echo
	echo "There is NO ${gr_SZN}/${gr_FJLTN}."	
	echo "Aborting ..."
	exit
fi

# ---
# put latest txt and html files in variables:
gr_FJLT="$(basename $(ls -1 ${gr_SZN}/checkout_weblinks_*.txt | tail -n1))"
gr_FJLH="$(basename $(ls -1 ${gr_SZN}/checkout_weblinks_*.html | tail -n1))"
gr_FJLTB="${gr_FJLTN}.bkp"

echo
printf "%-30s %s\n" "Txt URL list:" "$gr_FJLT"
printf "%-30s %s\n" "HTML URL list:" "$gr_FJLH"
printf "%-30s %s\n" "bekap file of Txt URL list:" "$gr_FJLTB"


echo
printf "%-30s %s\n" "Txt URL list - NEW:" "$gr_FJLTN"
printf "%-30s %s\n" "HTML URL list - NEW:" "$gr_FJLHN"


# ---
# check if OLD and NEW are the same - if they are abort:
if [ ${gr_FJLH} == ${gr_FJLHN} ]; then
	
	gr_STRA=" Old and NEW files are the same. Aborting ..."
	gr_SNCA="$((${#gr_STRA}+4))"
	echo
	N=1; while [ $N -le ${gr_SNCA} ]; do echo -n "#"; let N=N+1; done
	echo -e "\n# ${gr_STRA} #"
	N=1; while [ $N -le ${gr_SNCA} ]; do echo -n "#"; let N=N+1; done
	echo
	exit
else
	echo
	gr_STRC=" Old and NEW files are NOT the same. It is safe to continue. "
	gr_SNCC="$((${#gr_STRC}+4))"
	echo
	N=1; while [ $N -le ${gr_SNCC} ]; do echo -n "#"; let N=N+1; done
	echo -e "\n# ${gr_STRC} #"
	N=1; while [ $N -le ${gr_SNCC} ]; do echo -n "#"; let N=N+1; done
	echo

fi


# ---
# check if OK:
echo
read -p "OK? Press any key to continue, or <CTRL-C> to quit ___ "


# ---
# moving to SEZNAMI:
# echo && echo
# echo -e "---\n[ $(date +%Y%m%d-%H:%M:%S) ]"
# echo "moving to ${gr_SZN}"
# cd ${gr_SZN} && printf "%-30s %s\n" "We are in:" "$(pwd)"
# 

# ---
# create backup of old files:
echo
echo -e "---\n[ $(date +%Y%m%d-%H%M%S) ]"
echo "creating a backup copy of ${gr_SZN}/${gr_FJLTN} ..."

# checkig if bkp file exists:
if [ -f ${gr_SZN}/check*txt*.bkp ]; then
	echo && echo "bkp file exists. Removing ..."
	rm -v ${gr_SZN}/check*txt*bkp
fi

echo
cp -v ${gr_SZN}/${gr_FJLTN} ${gr_SZN}/${gr_FJLTN}.bkp
mv -v ${gr_SZN}/${gr_FJLH} ${gr_SZN}/${gr_FJLH}.old

# ---
echo
echo -e "---\n[ $(date +%Y%m%d-%H%M%S) ]"
echo "Converting from <txt> to <html> ..."

echo "Creating ${gr_SZN}/${gr_FJLHN} ..."
touch ${gr_SZN}/${gr_FJLHN}  
sed '/http/!s:$:<br>:' ${gr_SZN}/${gr_FJLTN} > ${gr_SZN}/${gr_FJLTN}.in
sed '/http/s:http.*$:<a href="&">&</a><br>:' ${gr_SZN}/${gr_FJLTN}.in > ${gr_SZN}/${gr_FJLHN}

echo
rm -v ${gr_SZN}/*.in
rm -v ${gr_SZN}/*.old

echo
echo -e "---\n[ $(date +%Y%m%d-%H%M%S) ] - DONE."


