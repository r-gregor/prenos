#! /usr/bin/env bash

# timestamp
function tms() {
    echo -n "[ $(date +%Y%m%d_%H%M%S) ] "
}

# START
echo
tms; echo "Starting $0 ..."

# ARGS ...
gr_FROM="/home/rgregor/majfajls/coding/"
gr_TO="/home/rgregor/Dropbox/ODPRTO/RUT_d_majfajls_coding/"

# DRYRUN ...
rsync -rltDv -n --delete --progress ${gr_FROM} ${gr_TO}

# END
tms; echo "Done!"
