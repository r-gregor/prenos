
check_subs() {
    # function to divide path filename and ending in separate vars
    # and check if there is fname.[srt]
    fjl=$1
        # echo "fjl = $fjl"
    fname=$(basename ${fjl})    # just filename
        # echo "fname = $fname" # test
    pth=$(dirname ${fjl})       # just path == directory name
        # echo "pth = $pth"     # test
        cname=${fname%.*}       # just filename (without ending)
        # echo "cname = $cname" # test
    if [ -f ${pth}/${cname}.srt ]; then
        # echo "${cname}.srt exists!"   # test
        # echo "Next ..."               # test
        :   # run nothing!
    else
        echo -e "There is NO ${cname}.srt in \n\t ${pth}\n"
    fi
}

#Usage:
# setting IFS to newline ...
IFS=$'\n'

for FFF in $(find $PWD -type f -iname "*.mp4" -o -iname "*.mkv"); do
    # for all moviefiles found in curdir run the check_subs function ...
    check_subs $FFF
done

# setting IFS to original value ...
IFS=$' \t\n'

