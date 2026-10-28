#! /usr/bin/env bash
# fname: /home/gregor.redelonghi/majstaf/_NERAZPOREJENO/__DANES__/test.sh
# descpt: 
# 20261028 v1
# last: 20261028
# ---

# === FUNCTIONS ===
help() {
    printf '%s' "Usage: $(basename "$0") [options]

The folowing OPTIONS are accepted:
    -h  displays this help page
    -d  mount using 'dmenu'
    -D  umount using 'dmenu'
    -f  mount using 'fzf'
    -F  umount using 'fzf'
    -r  mount using 'rofi'
    -R  umount using 'rofi'

Running" " $(basename "$0") " "without any argument displays this help text.
Run 'man dmscripts' for more information"
}

# === MAIN ===
printf "[i] running test ...\n"
help

printf "\n\n"

