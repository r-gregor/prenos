#! /usr/bin/env bash


if [ $# -lt 1 ]; then
    echo "NO ARGUMENTS!"
    exit
fi

# function run() {
    patt=$1
    echo $patt

    for ((i=2; i<=$#-1; ++i)); do
      patt="$patt | ${!i}"
    done
    echo $patt
    echo ${!i}
# }

# patt1=$1
# shift
# # patts="$@"
#
# echo "Pattern 1: $patt1"
#
# for PT in "$@"; do
#     patt1="$patt1 | $PT"
# done
# echo $patt1

# run
