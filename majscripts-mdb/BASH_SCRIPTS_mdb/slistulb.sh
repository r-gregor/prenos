# simple listulb


#! /usr/bin/env bash
for FFF in $(find /usr/local/bin/ -type l); do echo $FFF | cut -d'/' -f5; done | sort | column -c $(tput cols) | less

