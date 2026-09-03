#! /usr/bin/env bash
# 20260903 v2: number of copies either as parameter to program, or prompt if no parameter
#              if number of copies not set, set it to 4
# last 20260903
# ---

if [ $# -eq 1 ]; then
	NN=$1
else
	read -r -p "Število izvodov: " NN
fi

if [ -z $NN ]; then
	NN=4
fi

tmp_stmp=$(date +"%Y%m%d_%H%M")

FJL=$(find * -maxdepth 0 -name "*.pdf")
PTH=$PWD
PROJ=$(echo $PTH |cut -d'/' -f7- | tr '/' '_')

NRCL=narocilo_${tmp_stmp}.txt

msg() {
cat << EOF
Naročilo: ${tmp_stmp}_${PROJ}
SM=5300

Naročam ${NN}x plot celotnega načrta:
${FJL}

Vse obrezano in zloženo!

LP,

EOF
}

msg > ${NRCL}
echo "---" >> ${NRCL}
echo $(cygpath -w "$PWD") >> ${NRCL}
${HOME}/.local/bin/np ${NRCL}

