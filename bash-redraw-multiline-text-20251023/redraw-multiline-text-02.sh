#! /usr/bin/env bash
# v1 20251023 en
# v2 20251024 en
# last 20251024
	
function draw_num() {
	echo "-----------------------------------------------"
	echo "number: ${1}"
	echo "-----------------------------------------------"
}

clear
for ((i=0; i<10; i++)); do
	# echo "-----------------------------------------------"
	# echo "number: ${i}"
	# echo "-----------------------------------------------"
	draw_num ${i}
	sleep 0.2
	tput cuu 3
	tput ed
done
draw_num ${i}

