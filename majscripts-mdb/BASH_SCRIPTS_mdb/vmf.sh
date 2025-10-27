#! /usr/bin/env bash

### Name:	vmf.sh (vimfind)

if [ $# -eq 1 ]; then
	PTH=$1
	cd $PTH
fi

find . | fzf | xargs -o vim

