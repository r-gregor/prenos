#! /usr/bin/env bash
# filename: hstl_en.sh
# v1_20251120 create history commands snapshot
# last: 20251120
# ---


shopt -s histappend
HISTFILE=~/.bash_history
HISTCONTROL=erasedups
HISTCONTROL=ignoreboth
HISTSIZE=100000
HISTFILESIZE=5000
export HISTTIMEFORMAT='%F %T '

gPth="$HOME/majstaf/seznami/hstl-en-$(date +'%Y%m%d-%H%M%S').txt"
set -o history
history -r
history -a
history -w
history >> ${gPth}
set +o history
echo "Sccesfully added commands from HISTORY to ${gPth}"

