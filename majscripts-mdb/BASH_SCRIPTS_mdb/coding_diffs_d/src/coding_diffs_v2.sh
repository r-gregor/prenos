#! /usr/bin/env bash
#  coding_diffs_v2.sh
# 20230907 (en)


if [ $# -ne 1 ]; then
	echo -e "Usage $0 [N]
	\tnum ... c[dn]_N_*"
	exit
fi

N=$1

local_base="${HOME}/majstaf/coding"
remote_base="/c/Users/gregor.redelonghi/majstaf/drpbx-en/ODPRTO/MCDN_d/coding"
lang_test="C_Cpp_*/c_*_testing"

# local="${local_base}/C_Cpp_en/c_en_testing"
local="${local_base}/${lang_test}"
remote="${remote_base}/${lang_test}"

echo -e "\
LOCAL:\t$(echo ${local})\n\
REMOTE:\t$(echo ${remote})"
echo "---"
diff -q ${local}/cn_${N}_* ${remote}/cd_${N}_* | sed -e 's/\/home\/.*\//LOCAL\//g' -e 's/\/c\/.*\//REMOTE\//g'

