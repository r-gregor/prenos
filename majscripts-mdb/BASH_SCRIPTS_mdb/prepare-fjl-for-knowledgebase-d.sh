#! /bin/bash

if [ $# -ne 1 ]; then
    echo "You must supply filename as argument!"
    exit 1
fi

FJL=$1

rpr=/usr/local/bin/repair2-inplace-quotation-marks

# WIDOWS / cygwin
# npp=$HOME/majfajls/coding/00_ukazi/np.sh

# linux
npp=/usr/bin/mousepad
atm=/usr/bin/atom



# run command:

$rpr $FJL &&
echo "$FJL ... OPENING ..."
$atm $FJL
