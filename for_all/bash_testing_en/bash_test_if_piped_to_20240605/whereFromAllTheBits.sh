#!/bin/sh
# Copyright: see Copyright.md

if readlink /proc/$$/fd/0 | grep -q "^pipe:"; then
  echo "Pipe input:"
elif file $( readlink /proc/$$/fd/0 ) | grep -q "character special"; then
  echo "Standard input:"
else
  echo "File input:"
fi

cat # read from stdin and write to stdout