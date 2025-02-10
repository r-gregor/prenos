#! /usr/bin/env bash

unset usbs
usbs=()

readarray -t usbs < <(lsblk | grep -E 'sd.[0-9]' | grep -v 'sda' | sed 's/.*\(sd.[0-9]\).*/\1/')

if [ ${#usbs[@]} -eq 0 ]; then
	echo "[ERROR] No externa USB-s plugged"
	exit
fi

for (( i=0; i<${#usbs[$i]}; i++)); do
	PART=${usbs[$i]}
	# echo "disk-$((${i}+1)): ${usbs[$i]}"
	echo udisksctl mount -b /dev/${PART}
done

# for PART in sdb1 sdc1 sdd1; do echo udisksctl mount -b /dev/${PART}; done


