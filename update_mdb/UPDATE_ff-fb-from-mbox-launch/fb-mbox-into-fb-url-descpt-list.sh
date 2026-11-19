#! /usr/bin/env bash
# fname: fb-mbox-into-fb-url-descpt-list.sh
# descpt: create custom fb-links file from tom box file in curdir
# 20261119 v1
# last: 20261119
# ---

# === GLOBALS ===
unset names
unset urls
unset fb_messages
unset monthnums
declare -a names
declare -a urls
declare -A fb_messages
declare -A monthnums=(["Jan"]=1 ["Feb"]=2 ["Mar"]=3 ["Apr"]=4 ["May"]=5 ["Jun"]=6 ["Jul"]=7 ["Aug"]=8 ["Sep"]=9 ["Oct"]=10 ["Nov"]=11 ["Dec"]=12)

# SRCDIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
NOW=$(date +"%Y%m%d_%H%M%S")
CURDIR="${PWD}"
DESTFNAME="fb_files_list_from_mbox_${NOW}.txt"
DESTPTH="${CURDIR}/${DESTFNAME}"

# === FUNCTIONS ===
create_fb_files_list() {
	local month
	local mnth
	local dy
	local tmstmp
	local fname
	local dname
	local urls

	dos2unix "${src}" &> /dev/null

	if [ ! -f "${dst}" ]; then
		touch "${dst}"
	fi

	printf "[i] loading info from *.mbox file into '%s' ...\n" "${storage_dir}/${dst##*/}"
	while read -r LINE2; do
		if [[ $LINE2 =~ "Date" ]]; then
			yr=$(echo "${LINE2}" | cut -d' ' -f5)
			month=$(printf "%s" "$(echo "${LINE2}" | cut -d' ' -f4)")
			mnth="${monthnums["${month}"]}"
			dy=$(printf "%d" "$(echo "${LINE2}" | cut -d' ' -f3)")
			tmstmp=$(printf "%d%02d%02d" "$yr" "${mnth}" "${dy}")
		elif [[ "${LINE2}" =~ "Subject" ]]; then
			fname="$(echo "${LINE2}" | sed 's/Subject: //')"
			dname=$(printf "%s-%s" "${tmstmp}" "${fname}")
		elif [[ "${LINE2}" =~ 'https' ]]; then
			url=$(echo "${LINE2}" | grep -E '^https.*/$')
			if [[ "${url}" == "" ]]; then
				continue
			fi
			printf "%s;%s\n" "${url}" "${dname}" >> "${dst}"
		fi
	done < "${src}"
}

# === MAIN ===
if [ $# -ne 1 ]; then
	printf "[e] no source *.mbox file supplied\n"
	printf "[i] Usage: fb-mbox-into-fb-url-descpt-list <mbox file>\n\n"
	exit 1
else
	src="${CURDIR}/${1}"
fi

if [ ! -f "${src}" ]; then
	printf "[e] no such file: %s\n\n" "${src}"
	exit 1
fi

dst="${DESTFNAME}"

printf "[!] creating: '%s'\n" "${dst}"
read -r -p "[?] continue?"
create_fb_files_list
printf "[i] done\n\n"

