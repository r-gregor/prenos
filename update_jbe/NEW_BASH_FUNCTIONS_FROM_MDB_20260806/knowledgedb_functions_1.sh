
PTH="$HOME/Dropbox/ODPRTO"
SRC="${PTH}/_GO"

fillDatabase() {
	lpath=$1
	for FFF in $(find ${SRC}/* -regextype egrep -iregex ".*[^0-9][0-9]{8}\.txt"); do
		numpart=$(echo $FFF | sed 's/\(.*\)\([[:digit:]]\{8\}\).*/\2/')
		if [[ $numpart -ge $minNum ]]; then
			echo "$numpart $FFF"
		fi; done
}

# Usage:
fillDatabase ${SRC} | sort -nr

