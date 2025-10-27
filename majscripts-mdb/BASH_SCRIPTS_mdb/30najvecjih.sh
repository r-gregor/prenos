#! /bin/bash

### script:	30najvecjih.sh
### opis:	poisce in izpise 30 najvecjih map in datotek
###		sortirane po velikosti porabljenega prostora
###		na disku (30.najvecjih.[datestamp].txt) in to datoteko
###             shrani v /home/rgregor/majfajls/SEZNAMI/
### -----------------------------------------------------------------


# Variables:
gr_DATE=$(date +%Y-%m-%d.%H%M)
gr_DEST1="/home/rgregor/majfajls/SEZNAMI"
gr_FILE1="30.najvecjih_${gr_DATE}.txt"

gr_IZHD=/
gr_SZNM=~/majfajls/.tmp/list.dat
gr_DIRSI=~/majfajls/.tmp/list-by-size.dat

gr_ST_ZNAKOV=85

function crtice () {
	printf "%${gr_ST_ZNAKOV}s\n" | tr " " "-"	# draw a line of "-" number-of-chars times ...
	}

crtice
printf "%s\n" "[ $(date +%Y-%m-%d.%H%M) ] starting script \"$0\" ..."

crtice
rm -vvv ${gr_SZNM} ${gr_DIRSI}

sudo du -h --max-depth=1 ${gr_IZHD} 2>/dev/null | sort -hr | head -n 30 >> ${gr_DIRSI}

crtice
cat -n ${gr_DIRSI} | tee ${gr_DEST1}/${gr_FILE1}

cat ${gr_DIRSI} | awk '{$1=""; print $0}' >> ${gr_SZNM}


while read F; do
	echo "---------------------------------------------------------------" >>  ${gr_DEST1}/${gr_FILE1}
	sudo du -ah --max-depth=2 "${F}" 2>/dev/null | sort -hr | head -n5 >> ${gr_DEST1}/${gr_FILE1}

done <${gr_SZNM}
crtice
