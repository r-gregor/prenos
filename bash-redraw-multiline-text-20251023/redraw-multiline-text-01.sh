#! /usr/bin/env bash
# v1 20251023 en
# v2 20251024 en
# v3 20251027 en
# last 20251027

clear
for ((i=0; i<10; i++)); do
	echo -ne "-----------------------------------------------\n\
number:${i}\n\
-----------------------------------------------\
\r\n" # added newline
	sleep 0.2
	tput cuu 3 # +1 because added newline
	tput ed
done

echo -ne "-----------------------------------------------\n\
number:${i}\n-----------------------------------------------\n"
