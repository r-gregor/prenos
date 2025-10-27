#! /usr/bin/env bash
# v1
# 20230907

for LF in $(ls _python_d_testing/ | grep pd_); do
	# LFF = $(echo $LF | cut -b 8-)
	for RF in $(ls ~/_ODPRTO_drpbx/MCDN_en/coding/PYTHON_en/PYTHON_en_testing/ | grep pn_); do
		# RFF = $(echo $RF | cut -b 8-)
		if [ $(echo $LF | cut -b 8-) = $(echo $RF | cut -b 8-) ]; then
			echo $LF
			echo $RF
			echo -e "---"
		fi
	done
done

