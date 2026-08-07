
declare -a fjls_lst
declare -a selections
currdtstmp=$(date +"%Y%m%d")
dest_mdb="/home/rgregor/majstaf/majbin"


load_files_into_list() {
	for FFF in $(find ${dest_mdb}/* -name "*\.sh" | grep -v 'src/'); do
		dtstmp=$(grep last "$FFF" | grep -Eo "[0-9]{8}")
		if [ $? -eq 0 ]; then
			if [[ ${dtstmp} =~ ${djt} ]]; then
				fjls_lst+=("${FFF};${dtstmp}")
			else
				continue
			fi
		else
			continue
		fi
	done

	if [ ${#fjls_lst[@]} -eq 0 ]; then
		printf "[INFO] no file with datestamp: '%s' found\n\n" "${dtstmp}"
		exit 1
	fi

	fjls_lst+=("---;${currdtstmp}")
	fjls_lst+=("Quit;${currdtstmp}")
}

# Usage:
#	Usage: list-scripts-by-last-timestamp <datestamp>
#		<datestamp> format: YYYYmmdd ("20260520")
#                            at least YYYYmm


