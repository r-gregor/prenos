#! /usr/bin/env bash
# last change  20240213 (d)

MJSTFD=/home/rgregor/majstaf
DBRC=${MJSTFD}/d_metsys_git/src_d_metsys/majrcs_d
DMTS=${MJSTFD}/metsys_muadib
DBIN=${MJSTFD}/d_metsys_git/src_d_metsys/majbin_d
DDOT=${MJSTFD}/d_metsys_git/src_d_metsys/dotfiles_d
GMTS=${MJSTFD}/d_metsys_git/src_d_metsys/metsys_d/metsys_muadib

cd ${MJSTFD}/majrcs
echo "[INFO] diffs: d_majrcs ..."
for FFF in $(find $DBRC/ -type f); do diff -q $FFF $(echo $FFF | cut -d'/' -f8-); done 2>/dev/null
echo "---"
cd $HOME
#---
cd ${MJSTFD}/majbin
echo "[INFO] diffs: d_majbin ..."
for FFF in $(find $DBIN/ -type f); do diff -q $FFF $(echo $FFF | cut -d'/' -f8-); done 2>/dev/null
echo "---"
cd $HOME
#---
cd $HOME
echo "[INFO] diffs: d_dotfiles ..."
for FFF in $(find $DDOT -type f -not -path "*.config/*"); do diff -q $FFF $(echo $FFF | cut -d'/' -f8-) 2>/dev/null; done
echo "---"
#---
cd ${GMTS}
echo "[INFO] diffs: metsys_muadib ..."
diff -qr ${GMTS} ${DMTS} | grep -iv common
echo "---"
cd $HOME

