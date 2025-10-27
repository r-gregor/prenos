#! /usr/bin/env bash

for FFF in $(ls -1); do echo $(echo $FFF | sed 's/\(.*\)_\([[:digit:]]\{8\}\).txt/\2 /') $FFF; done | sort -nr
