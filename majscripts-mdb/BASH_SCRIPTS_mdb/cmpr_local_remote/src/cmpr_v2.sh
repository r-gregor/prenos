#! /usr/bin/env bash
# v2
# 20230907 (d)

LOCAL="~/python_d_testing/"
REMOTE="~/_ODPRTO_drpbx/MCDN_en/coding/PYTHON_en/PYTHON_en_testing/"

for LF in $(ls _python_d_testing/ | grep pd_); do
	echo -n "$LF"
	single=0
	for RF in $(ls ~/_ODPRTO_drpbx/MCDN_en/coding/PYTHON_en/PYTHON_en_testing/ | grep pn_); do
		# RFF = $(echo $RF | cut -b 8-)
		if [ $(echo $LF | cut -b 8-) = $(echo $RF | cut -b 8-) ]; then
			echo -e "\n$RF"
			echo -e "---"
			single=1
		fi
	done
	if [ $single -eq 0 ]; then
		echo " -- SINGLE"
		echo -e "---"
	fi
done

