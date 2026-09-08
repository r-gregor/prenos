#! /usr/bin/env bash
# fname: check.sh
# 20260908 v1
# ---
while read MDB; do
	while read EN; do
		found=0
		if [[ $MDB =~ $EN ]]; then
			echo "$EN --> $MDB"
			found=1
			break
		else
			continue
		fi
	if [ found -eq 0 ]; then
		echo "$MDB NOT found!"
	fi
	done < en_mappings
done < dot-vimrc-mdb-mapped-commands-20260907.txt

