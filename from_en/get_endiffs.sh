#! /usr/bin/env bash
# get_ndiffs
# last change 20240229 (en)

CURRDIR=$PWD
MJSTFN=${HOME}/majstaf_en
MJSTFN_G=${MJSTFN}/engit
TMPF="${HOME}/.tmp/getd_tmp"


cd ${MJSTFN_G}/dotfiles_en
echo "[INFO] diffs: dotfiles_en ..."
touch $TMPF
for FFF in $(ls -1A); do diff -qr $FFF ${HOME}/${FFF} 2>/dev/null | grep -iv 'only' >> $TMPF; done
output=$(cat $TMPF | head -c1 | wc -c)
if [ $output -ne 0 ]; then
	while read LINE; do
		printf "\t$LINE\n"
	done < $TMPF
	printf "\n"
fi
rm $TMPF 2>/dev/null

for check_dir in majbin_en majrcs_en metsys_en; do
	cd ${MJSTFN_G}/${check_dir}
	echo "[INFO] diffs: ${check_dir} ..."
	touch $TMPF
	for FFF in $(ls -1); do diff -qr $FFF ${MJSTFN}/${check_dir}/${FFF} | grep -iv 'only' >> $TMPF; done
	output2=$(cat $TMPF | head -c1 | wc -c)
	if [ $output2 -ne 0 ]; then
		while read LINE; do
			printf "\t$LINE\n"
		done < $TMPF
		printf "\n"
	fi
	rm $TMPF 2>/dev/null
	cd $HOME
done

cd ${CURRDIR}

