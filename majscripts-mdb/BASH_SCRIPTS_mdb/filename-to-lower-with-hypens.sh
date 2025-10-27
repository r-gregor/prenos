#!/bin/bash

arg="$@"

SMALL=$(echo $arg | tr [:upper:] [:lower:] | tr ' ' '-')

echo $SMALL
echo $SMALL | putclip   # use xclip on Linux!!