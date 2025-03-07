SRCDIR="./__metsys_STARO__"
TESTDIR="./metsys"

nfs() {
	IFS=$'\n'
}

ofs() {
	IFS=$' \t\n'
}

nfs
for FFF in $(find ${SRCDIR}/* -type f | cut -d'/' -f3-); do
	FND=${TESTDIR}/${FFF}
	if [ -f $FND ]; then
		echo "${FND} FOUND!"
	fi
done
ofs

