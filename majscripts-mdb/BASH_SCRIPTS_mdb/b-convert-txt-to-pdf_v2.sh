#! /bin/bash

# filename:     b-convert-txt-to-pdf.sh
# version:      V2 -- 20220926
#
# !!! It requires enscript and ghostscript apps to be installed !!!
# Both are usually in base repos.
#
# changed so it can compile all ascii files (.c, .go, .py, .java, ...)
#

# timestamp
function tms() {
    echo -n "[ $(date +%Y%m%d_%H%M%S) ] "
}

# START
tms; echo "Starting $0"

# test if filename supplied as argument
if [ ! $# -eq 1 ]; then
    echo -e "\n\tUsage:"
    echo -e "\t$0 [filename]"
    echo
    exit
fi

FJL=$(realpath $1)
FJL_pth=$(dirname ${FJL})
FJL_pth_new="${FJL_pth}/0_converted_to_PDF"
FJL_fnm=$(basename ${FJL})
FJLPS="${FJL_pth_new}/${FJL_fnm}.ps"
FJLPDF="${FJL_pth_new}/${FJL_fnm}.pdf"

# test if dest file already exists
if [ -e ${FJLPDF} ]; then
    tms; echo "*** File .0_converted_to_PDF/${FJL_fnm}.pdf already exists! ***"
    tms; echo "No conversion done."
    # tms; echo -e "---\n"
    echo "---"
    exit
fi

# NEW 20220926
# test if ASCII with /usr/bin/file [filename] | grep -i ASCII'
# !!! the test expression must be inside "", or it may be bash error:
#        ... bash  unary operator expected!
# NEW 20230303
# test if ASCII "OR" UTF-8!!
if [ "$(/usr/bin/file.exe ${FJL_fnm} | /usr/bin/grep "ASCII\|UTF-8")" == "" ]; then
    tms; echo "*** ${FJL_fnm} is NOT ASCII or UTF-8 file! ***"
    tms; echo "No conversion done."
    # tms; echo -e "---\n"
    echo "---"
    exit
else
    tms; echo "${FJL_fnm} is ASCII file. It is safe to continue."
fi

# test if FJL_pth_new exists. If NOT make new
if [ ! -e ${FJL_pth_new} ]; then
    tms; echo "Directory ./0_converted_to_PDF NOT found!"
    tms; echo "Creating ./0_converted_to_PDF ..."
    mkdir -v -p ${FJL_pth_new} | while read -r line; do echo $line | sed "s/.*/[ $(date +%Y%m%d_%H%M%S) ] &/"; done
else
    tms; echo "Directory ./0_converted_to_PDF exists. It is safe to continue."
fi

# test if source file exists
if [ ! -e ${FJL} ]; then
    tms; echo "${FJL_fnm} NOT found!"
    # tms; echo -e "---\n"
    echo "---"
    exit
fi

tms; echo "Source file:      ./${FJL_fnm}"
tms; echo "PS file:          ./${FJL_fnm}.ps"
tms; echo "Destination file: ./${FJL_fnm}.pdf"
tms; echo "Converting ..."
enscript -v -f "Iosevka8" -F "Iosevka8" --header='$n||Page $% of $=' -p ${FJLPS} ${FJL} 2> info2
# enscript -v -f "Consolas8" -F "Consolas8" --header='$n||Page $% of $=' -p ${FJLPS} ${FJL} 2> info2
while read -r INFOL; do echo $INFOL | sed "s/.*/[ $(date +%Y%m%d_%H%M%S) ] &/"; done <info2
ps2pdf ${FJLPS} ${FJLPDF}
rm info2 > /dev/null

tms; echo "Removing *.ps file ..."
rm -v ${FJLPS} | while read -r line; do echo $line | sed "s/.*/[ $(date +%Y%m%d_%H%M%S) ] &/"; done
# tms; echo -e "---\n"
echo "---"

