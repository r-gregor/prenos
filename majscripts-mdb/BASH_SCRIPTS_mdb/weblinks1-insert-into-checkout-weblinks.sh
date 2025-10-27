#! /bin/bash

## Name:	insert_into_checkout_weblinks.sh
### Author:	RgregoR
### Date:	20150420
### Decription: Inserts links list from $DOMA/SEZNAMI/IZ-ENERGETIKE/*.txt files
### 		to $DOMA/SEZNAMI/checkout_weblinks_$CURDATE.txt and rwmoves
### 		all double lines with single lines before # --- 

### 
 
# environment:
export DOMA="/home/rgregor/majfajls"
gr_IZE="$DOMA/SEZNAMI/IZ-ENERGETIKE"
gr_SZN="$DOMA/SEZNAMI"
gr_TMP="$DOMA/.tmp"
gr_TXT="$(basename $(ls -1 ${gr_SZN}/checkout_weblinks*.txt))"
gr_TXTB="${gr_TXT}.bkp"
gr_TXTCURDATE="$(date +%Y%m%d)"
gr_TXTN="checkout_weblinks_${gr_TXTCURDATE}.txt"


echo "DOMA: $DOMA"
echo "gr_IZE: ${gr_IZE}"
echo "gr_SZN: ${gr_SZN}"
echo "gr_TXT: ${gr_TXT}"
echo "gr_TXTB: ${gr_TXTB}"
echo "gr_TXTCURDATE: ${gr_TXTCURDATE}"
echo "gr_TXTN: ${gr_TXTN}"

read -p "Proceed?"


# TEST if links IZ-ENERGETIKE exist:


ls -1 ${gr_IZE}/*.txt
if [ $? -ne 0 ]; then
	echo
	echo "there are NO *.txt files in  ${gr_IZE}"
	echo "Exiting ..."
	exit 1
fi


# 1: backup TXT-source
echo
echo "Backing up ${gr_SZN}/${gr_TXT} ..."
cp -v ${gr_SZN}/${gr_TXT} ${gr_IZE}/${gr_TXTB}
cp -v ${gr_SZN}/${gr_TXT} ${gr_TMP}/${gr_TXT}.in

read -p "Proceed?"

# 2: insert links IZ-ENERGETIKE to TXT-source
echo
echo "Inserting IZ-ENERGETIKE/*txt to  ${gr_TMP}/${gr_TXT}.in ..."
for FFF in $(ls -1 ${gr_IZE}/*.txt); do
	gr_FJL="$(basename $FFF)"
	echo "cat ${gr_IZE}/${gr_FJL} >> ${gr_TMP}/${gr_TXT}.in"
		cat ${gr_IZE}/${gr_FJL} >> ${gr_TMP}/${gr_TXT}.in
		mv -v ${gr_IZE}/${gr_FJL} ${gr_IZE}/${gr_FJL}.brisi
done

read -p "Proceed?"

# 3: Insert newlines infront of labels
echo
echo "Inserting newlines infront of labels in ${gr_TMP}/${gr_TXT}.in ..."
sed -i '/^$/d;/http/!s/.*/\n&/' ${gr_TMP}/${gr_TXT}.in

read -p "Proceed?"

echo
echo "Copying *.in to ${gr_TXTN}"
cp -v ${gr_TMP}/${gr_TXT}.in ${gr_SZN}/${gr_TXTN}

echo
echo "Removing old ${gr_TXT} ..."
rm -v ${gr_SZN}/${gr_TXT}

echo
echo "Removing *.bkps from ${gr_IZE} ..."
rm ${gr_IZE}/${gr_TXTB}

echo
echo "Labeling *.in to *.in*brisi ..."
mv -v ${gr_TMP}/${gr_TXT}.in ${gr_TMP}/${gr_TXT}.in.brisi

echo
echo "DONE"

