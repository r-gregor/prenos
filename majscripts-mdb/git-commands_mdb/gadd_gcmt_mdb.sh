#! /usr/bin/env bash
# gaddacomm
# last change: 20240911

gcmd="/usr/bin/git add --verbose ."
gcmt="${HOME}/.local/bin/gcommit_timestamp_mdb"


# display commands
echo -en "running: ${gcmd}\n" && ${gcmd}
echo
echo -en "running: ${gcmt}\n" && ${gcmt}

