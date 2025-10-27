#! /bin/bash

### Name:	convert-filename-to-lowercase-with-hypens_20160202.sh
### Author:	RgregoR
### Date:	20211006
### Decription:	converts string from parameter to lowercase, spaces replaced with hypens
### 
### 
### 
 
# INPUT TEXT:
# echo "<filename>" | tr '[:upper:]' '[:lower:]' | tr ' ' '-'

usage() {
cat <<MSG

Usage:
	$0 <String with spaces>

MSG
exit 1
}

if [ $# -ne 1 ]; then
	usage
fi

oname=$1
echo ${oname} | tr '[:upper:]' '[:lower:]' | sed -e 's/: */_/g' -e 's/,//g' | tr ' ' '-'
# read -p "Enter the filename with uppercase letters and/or spaces: " gr_FJLNM
# echo "You supplied the filename: ${gr_FJLNM}"
# read -p "Correct?"
# 
# echo
# echo "Converting filename to loweracse with hypens inplace of spaces ..."
# gr_FJLNMC=$(echo ${gr_FJLNM} |  tr '[:upper:]' '[:lower:]' | sed -e 's/: */_/g' -e 's/,//g' | tr ' ' '-')
# echo "NEW filename: ${gr_FJLNMC}"
# read -p "Correct?"
# 
# echo
# echo ${gr_FJLNMC} | sed 's/"//g'
# echo

