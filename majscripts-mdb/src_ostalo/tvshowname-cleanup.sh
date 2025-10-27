#! /bin/bash

# test
# for FFF in $(ls -1 .); do echo "mv -v $FFF $(echo $FFF | sed 's/\(.*[sS]01...\)\(.*\)\(\....\)/\1\3/')"; done
for FFF in $(ls -1 .); do echo "mv -v $FFF $(echo $FFF | sed 's/\(.*[sS][0-9][0-9][eE][0-9][0-9]\)\(.*\)\(\...\)/\1\3/')"; done

read -p "Press any key to continue or <ctrl+c> to quit ... "
# for FFF in $(ls -1 .); do mv -v $FFF $(echo $FFF | sed 's/\(.*[sS]01...\)\(.*\)\(\....\)/\1\3/'); done
for FFF in $(ls -1 .); do mv -v $FFF $(echo $FFF | sed 's/\(.*[sS][0-9][0-9][eE][0-9][0-9]\)\(.*\)\(\...\)/\1\3/'); done
