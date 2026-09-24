#! /usr/bin/env bash
# fname: unmdballscripts.sh
# 20260924 v1
# ---

for FFF in $(find * -name "*.sh"); do echo mv $FFF ${FFF//-mdb.sh/.sh}; done
read -r -p "OK?"
for FFF in $(find * -name "*.sh"); do mv $FFF ${FFF//-mdb.sh/.sh}; done

for FFF in $(find * -name "*.sh"); do echo mv $FFF ${FFF//-mdb-/-}; done
read -r -p "OK?"

for FFF in *.sh; do softlink1-fname-to-ulb $FFF; done

