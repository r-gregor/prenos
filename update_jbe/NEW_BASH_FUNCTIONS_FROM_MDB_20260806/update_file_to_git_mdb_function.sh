HST="mdb"
SRCDIR=$PWD
SRCF="${SRCDIR}/${fname}"
DSTF=$(echo $SRCDIR/${fname} | sed "s/\(.*majstaf\)\/\([[:alpha:]]\+\)\/\(.*\)/\1\/${HST}git\/\2_${HST}\/\3/")

update_file_to_git() {
	printf "%s\n%s\n%s\n" \
		"from: ${SRCF}" \
		"to:   ${DSTF}" \
		"---"
	read -p "OK?"
	cp -iv "${SRCF}" "${DSTF}"
}

# Usage
update_file_to_git

