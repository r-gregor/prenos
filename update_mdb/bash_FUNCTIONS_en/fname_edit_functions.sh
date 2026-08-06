
upper_to_lower() {
	tr [:upper:] [:lower:]
}

lower_to_upper() {
	tr [:lower:] [:upper:]
}


spc_to_hypen() {
	tr ' ' '-'
}

nonalpha_to_dot () {
	sed 's/[^[:alnum:]]\|[[:punct:]]\+/_/g'
}


# Usage:
fname=$1
raw_fname=${fname%.*}
ext=${fname##*.}

ffname=$(echo "${raw_fname}" | upper_to_lower | spc_to_hypen | nonalpha_to_dot)
echo "${ffname}.${ext}"

