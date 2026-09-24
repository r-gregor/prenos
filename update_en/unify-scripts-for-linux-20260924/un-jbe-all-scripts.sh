#! /usr/bin/env bash
# fname: un-jbe-all-scripts.sh
# 20260924 v1
# ---

for FFF in $(find * -name "*.sh"); do echo mv $FFF ${FFF//-jbe.sh/.sh}; done
read -r -p "OK?"
for FFF in $(find * -name "*.sh"); do mv $FFF ${FFF//-jbe.sh/.sh}; done

for FFF in $(find * -name "*.sh"); do echo mv $FFF ${FFF//-jbe-/-}; done
read -r -p "OK?"

for FFF in *.sh; do softlink1-fname-to-ulb $FFF; done

