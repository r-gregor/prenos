
CMD='for FFF in $(\ls -1); do echo $(echo $FFF | sed "s/\(.*\)_\([[:digit:]]\{8\}\).*/\2 /") $FFF; done | sort -nr'

run1() {
	# eval $CMD | less
	eval $CMD
}

run2() {
	NR=$1
	eval $CMD | head -n ${NR}
}

if [[ ! $# -eq 1 ]]; then
	run1
else
	run2 $1
fi

