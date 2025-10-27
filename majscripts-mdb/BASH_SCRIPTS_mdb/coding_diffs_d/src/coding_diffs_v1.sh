#! /usr/bin/env bash
# coding_diffs_v1.sh
# 20230907 (en)

if [ $# -ne 1 ]; then
	echo -e "Usage $0 [N]
	\tnum ... c[dn]_N_*"
	exit
fi

N=$1

local_en="${HOME}/majstaf/coding/C_Cpp_en/c_en_testing"
remote_d="/c/Users/gregor.redelonghi/majstaf/drpbx-en/ODPRTO/MCDN_d/coding/C_Cpp_d/c_d_testing"

echo -e "\
LOCAL:\t$(ls -1d ${local_en}/cn_${N}_*)\n\
REMOTE:\t$(ls -1d ${remote_d}/cd_${N}_*)"
echo "---"
diff -q ${local_en}/cn_${N}_* ${remote_d}/cd_${N}_* | sed -e 's/\/home\/.*\//LOCAL\//g' -e 's/\/c\/.*\//REMOTE\//g'
# diff -q ${local_en}/cn_${N}_* ${remote_d}/cd_${N}_* | sed -e 's/\/home\/.*\///g' -e 's/\/c\/.*\///g'

