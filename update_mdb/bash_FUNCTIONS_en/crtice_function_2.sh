
# timestamp
tms() {
	echo -n "[ $(date +%Y%m%d_%H%M%S) ] "
}

crtn=100
crtc() {
	for ((i=1; i<=$1; i++)); do
		echo -n "-"
	done
	echo
}

# Usage:
tms; crtc $(($crtn-20))
crtc $crtn

