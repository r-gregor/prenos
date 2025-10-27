#! /usr/bin/env bash
# v3
# 20230907 (d)

LOCAL="${HOME}/_python_d_testing/"
REMOTE="${HOME}/_ODPRTO_drpbx/MCDN_en/coding/PYTHON_en/PYTHON_en_testing/"

function local_to_remote() {
	for LF in $(ls ${LOCAL} | grep p[dn]_); do
		single=0
		for RF in $(ls ${REMOTE} | grep p[dn]_); do
			if [ $(echo $LF | cut -b 8-) = $(echo $RF | cut -b 8-) ]; then
				echo "$LF"
				echo "$RF"
				echo -e "---"
				single=1
			fi
		done
	done
}

function local_singles() {
	for LF in $(ls ${LOCAL} | grep p[dn]_); do
		single=0
		for RF in $(ls ${REMOTE} | grep p[dn]_); do
			if [ $(echo $LF | cut -b 8-) = $(echo $RF | cut -b 8-) ]; then
				single=1
			fi
		done
		if [ $single -eq 0 ]; then
			echo "$LF -- SINGLE"
		fi
	done
	echo "---"
}
function remote_singles() {
	for RF in $(ls ${REMOTE} | grep p[dn]_); do
		single=0
		for LF in $(ls ${LOCAL} | grep p[dn]_); do
			if [ $(echo $RF | cut -b 8-) = $(echo $LF | cut -b 8-) ]; then
				single=1
			fi
		done
		if [ $single -eq 0 ]; then
			echo "$RF -- SINGLE"
		fi
	done
	echo "---"
}

local_to_remote
local_singles
remote_singles

