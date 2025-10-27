#! /bin/bash

# change: 20150310
# change: 20200308:	- display only basename of /usr/local/bin/[filename]
#					- sorted output by /usr/local/bin/[filename]


clear
echo "List of \"soft-linked\" scripts in /usr/local/bin:"
echo

for aaa in $(find /usr/local/bin -type l); do
	F1=$(basename "${aaa}")
	F2=$(ls -lgG "${aaa}" | awk '{print $9}')
    printf "%-50s%s\n" $F1 $F2 | tr ' ' '.'
done | sort
echo
 