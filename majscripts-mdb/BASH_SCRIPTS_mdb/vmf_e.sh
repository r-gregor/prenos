#! /usr/bin/env bash

### Name:	vmf.sh (vimfind)
# -e flag for exact match

if [ $# -eq 1 ]; then
	PTH=$1
	cd $PTH
fi

find . | fzf -e | xargs -o vim

