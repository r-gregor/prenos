#! /usr/bin/env bash
# 20260831 v3: fzf files list sorted by cathegory
# last: 20260831
# ---


unset fljs
# v3
# readarray -t fjls < <(for FJL in $(echo ${RESULT[@]}); do echo "$FJL"; done | fzf -m -e --reverse)
readarray -t fjls < <(for FJL in $(echo ${RESULT[@]}); do echo "$FJL"; done | sort -t'/' -k7 | fzf -m -e --reverse)
#                                                                           ^^^^^^^^^^^^^^^^^

