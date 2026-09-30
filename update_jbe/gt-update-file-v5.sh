#! /usr/bin/env bash
# fname: gt-update-file.sh
# descpt: Update file from src-dir to git-repository
# 20260301 v1
# 20260401 v2: added 'OK?' check into update_file_to_git() function
# 20260924 v3: can be run from anywhere for any file
#              checks for SRC and DEST directories/files
# 20260924 v4: unified scripts for linux
#              HST and system info from exported global variable
# 20260930 v5: added update_log() function to log updates into 'gt-update_file_to_git.log'
#              '*.log must exist, or script terminates
# last: 20260924
# ---

if [ $# -ne 1 ]; then
	printf "\tUsage: gt-update-file <src_fname>\n\n"
	exit 1
else
	src_fname=$(realpath "$1")
fi

if [ ! -f ${src_fname} ]; then
	printf "[E] no such source file: %s\n\n" "${src_fname}"
	exit 1
fi

SRCF="${src_fname}"
SRCD="${SRCF%/*}"

dest_fname=$(echo ${src_fname} | sed "s/\(.*majstaf\)\/\([[:alpha:]]\+\)\/\(.*\)/\1\/${HST}git\/\2_${HST}\/\3/")

DSTF="$(realpath "${dest_fname}")"
DSTD="${DSTF%/*}"

if [ ! -d "${DSTD}" ]; then
	printf "[E] no such destination: %s\n\n" "${DSTD}"
	exit 1
fi

ptrn="majstaf/${HST}git"

if [[ ! "${DSTD}" =~ ${ptrn} ]]; then
	printf "[E] file '%s' must be copied over directly\n\n" "${SRCF}"
	exit 1
fi

if [ ! -f "${DSTF}" ]; then
	printf "[W] no such file on destination: %s\n" "${DSTF##*/}"
	read -r -p "[?] Continue?"
fi

update_log() {
	SRCF="${1}"

	local ldest
	local ltmpstmp
	local lsrcf

	ltmpstmp="[$(date +"%Y%m%d-%H%M%S")] --"
	ldest="${HOME}/majstaf/majlogs/gt-update-file.log"
	lsrcf=$(realpath "${SRCF}")

	if [ ! -f "${ldest}" ]; then
		printf "[E] no log file: '%s'\n\n" "${ldest}"
		exit 1
	fi

	printf "%s updated: %s\n" "${ltmpstmp}" "$(realpath "${SRCF}")" >> "${ldest}"
}

update_file_to_git() {
	printf -- "%s\n%s\n%s\n" \
		"[i] from: ${SRCF}" \
		"[i] to:   ${DSTF}" \
		"[i] ---"
	read -p "[?] OK?"
	cp -iv "${SRCF}" "${DSTF}"

	# new 20260930
	update_log "${SRCF}"
}


# MAIN
update_file_to_git
printf "\n"

