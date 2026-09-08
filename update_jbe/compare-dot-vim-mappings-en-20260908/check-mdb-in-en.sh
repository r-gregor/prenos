#! /usr/bin/env bash
# fname: check-mdb-in-en.sh
# 20260908 v1
# ---
while read EN; do
	while read MDB; do
		found=0
		if [[ $MDB =~ $EN ]]; then
			echo "$EN --> $MDB"
			found=1
			break
		else
			continue
		fi
	done < mdb_mappings
	if [ $found -eq 0 ]; then
		echo "$EN NOT found!"
	fi
done < en_mappings

