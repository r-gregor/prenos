#! /usr/bin/env bash
	
clear
for ((i=0; i<10; i++)); do
	echo -ne "-----------------------------------------------\nnumber: ${i}\n-----------------------------------------------\r"
	sleep 1
	tput cuu 2
	tput ed
done

