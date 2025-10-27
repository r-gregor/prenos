#! /usr/bin/env bash
# coding_diffs_v3.sh
# 20230907 (en)


if [ $# -ne 2 ]; then
echo -e "Usage:\n\
\t $0 -[l] (c,j,p,r) [num]

\t\t-[l]    ... -c (C), -j (JAVA), -p (PYTHON), -r (RUST)\n\
\t\t [num]  ... cd_108_* = cd_num_; num=108"
	exit
fi

L=$1
N=$2

if [ "$L" = "-c" ]; then
	lang_test="C_Cpp_*/c_*_testing"
	ll="c"
elif [ "$L" = "-j" ]; then
	lang_test="JAVA_*/JAVA_*_testing"
	ll="j"
elif [ "$L" = "-p" ]; then
	lang_test="PYTHON_*/PYTHON_*_testing"
	ll="p"
elif [ "$L" = "-r" ]; then
	lang_test="RUST_*/rust_*_testing"
	ll="r"
else
	echo "Something went wrong!"
	exit
fi


local_base="${HOME}/majstaf/coding"
remote_base="/c/Users/gregor.redelonghi/majstaf/drpbx-en/ODPRTO/MCDN_d/coding"

# local="${local_base}/C_Cpp_en/c_en_testing"
local="${local_base}/${lang_test}"
remote="${remote_base}/${lang_test}"

echo -e "\
LOCAL:\t$(ls -1d ${local}/${ll}n_${N}_*)\n\
REMOTE:\t$(ls -1d ${remote}/${ll}d_${N}_*)"

echo "---"
diff -q ${local}/${ll}n_${N}_* ${remote}/${ll}d_${N}_* | sed -e 's/\/home\/.*\//LOCAL\//g' -e 's/\/c\/.*\//REMOTE\//g'

