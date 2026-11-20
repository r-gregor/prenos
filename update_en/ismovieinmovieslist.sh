#! /usr/bin/env bash
# fname: ismovieinmovieslist
# descpt: check if part of movie name is in external movies list file
# 20260929 v1
# 20261013 v2 change seivom_pth --> make it universal
# last: 20261013
# ---

# === GLOBALS ===
unset found_movies
unset chk_movies_list
declare -a found_movies
declare -a chk_movies_list

chk_mvs_pth="${HOME}/majstaf/majmedia/MOVIES_CHECKOUT.txt"

# === FUNCTIONS ===
capitalize_string() {
	unset words
	declare -a words
	while read -r STRING; do
		for WORD in $STRING ; do
			words+=( "$WORD" )
		done
	done < <(echo $1)

	printf "'"
	for (( i = 0; i < $(( ${#words[@]} - 1 )); i++ )); do
		singlew="${words[i],,}"
		printf -- "${singlew^} "
	done
	lastw="${words[$(( "${#words[@]}" - 1 ))],,}"
	printf -- "${lastw^}"
	printf "'\n"
}

# === MAIN ===
if [ $# -ne 1 ]; then
	printf "[e] must supply a part of movie name\n\n"
	exit 1
else
	PTRN="$1"
fi

readarray -t chk_movies_list < <(cat "${chk_mvs_pth}" | tr "[:upper:]" "[:lower:]" | sed 's/ ([0-9]\{4\})//' | sort | uniq)

for CHKMV in "${chk_movies_list[@]}"; do
	if [[ "${CHKMV,,}" =~ "${PTRN,,}" ]]; then
		found_movies+=( "${CHKMV}" )
	fi
done

if [ "${#found_movies[@]}" -le 0 ]; then
	printf "[!] '%s' is NOT in the: '%s' file\n\n" "${PTRN}" "${chk_mvs_pth##*/}"
	exit 1
else
	printf "[!] movies from '%s' with '%s' in movie-name:\n" "${chk_mvs_pth##*/}" "${PTRN}"
	for MV in "${found_movies[@]}"; do
		printf "\t%s\n" "$(capitalize_string "${MV}")"
	done
fi

printf "\n"

