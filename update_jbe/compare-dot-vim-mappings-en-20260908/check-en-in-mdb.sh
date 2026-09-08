#! /usr/bin/env bash
# fname: check-en-in-mdb.sh
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
	done < en_mappings
	if [ $found -eq 0 ]; then
		echo "$MDB NOT found!"
	fi
#done < dot-vimrc-mdb-mapped-commands-20260907.txt
done < mdb_mappings

