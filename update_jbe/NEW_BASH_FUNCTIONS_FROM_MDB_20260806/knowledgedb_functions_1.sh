
gPth="$HOME/Dropbox/ODPRTO"
gSrc="${gPth}/_GO"

fillDatabase() {
	lpath=$1
	for FFF in $(find ${gSrc}/* -regextype egrep -iregex ".*[^0-9][0-9]{8}\.txt"); do
		numpart=$(echo $FFF | sed 's/\(.*\)\([[:digit:]]\{8\}\).*/\2/')
		if [[ $numpart -ge $minNum ]]; then
			echo "$numpart $FFF"
		fi; done
}

# Usage:
fillDatabase ${gSrc} | sort -nr

