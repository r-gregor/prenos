#! /bin/bash

# filename:     b_convert_txt_to_pdf.sh
# version:      V1 -- 20190215
#
# !!! It requires enscript and ghostscript apps to be installed !!!
# Both are usually in base repos.
#
#
#

# timestamp
function tms() {
    echo -n "[ $(date +%Y%m%d_%H%M%S) ] "
}

# START
tms; echo "Starting $0 ..."

# test if filename supplied as argument
if [ ! $# -eq 1 ]; then
    echo -e "\n\tUsage:"
    echo -e "\t$0 [filename.txt]"
    echo
    exit
fi

FJL=$(realpath $1)
FJL_pth=$(dirname ${FJL})
FJL_pth_new="${FJL_pth}/0_converted_to_PDF"
FJL_fnm=$(basename ${FJL})
FJL_nm=${FJL_fnm%%.*}
FJL_ext=${FJL_fnm##*.}
FJLPS="${FJL_pth_new}/${FJL_nm}.ps"
FJLPDF="${FJL_pth_new}/${FJL_nm}.pdf"

# === TEST PRINT =============================================================================================
# tms; echo "Variables:"
# tms; echo "FJL = $FJL"
# tms; echo "FJL_pth = $FJL_pth"
# tms; echo "FJL_fnm = $FJL_fnm"
# tms; echo "FJL_nm = $FJL_nm"
# tms; echo "FJL_ext = $FJL_ext"
# tms; echo "FJLPS = $FJLPS"
# tms; echo "FJLPDF = $FJLPDF"
# === TEST PRINT =============================================================================================


# test if file is text file (ext = txt)
if [ ! ${FJL_ext} == "txt" ]; then
    tms; echo "File must be *.txt file!"
    exit
else
    tms; echo "File is *.txt file. It is safe to continue."
fi

# test if FJL_pth_new exists. If NOT make new
if [ ! -e ${FJL_pth_new} ]; then
    tms; echo "Directory ${FJL_pth_new} NOT found!"
    tms; echo "Creating ..."
    mkdir -v -p ${FJL_pth_new}
else
    tms; echo "Directory [ ${FJL_pth_new} ] exists. It is safe to continue."
fi

# test if source file exists
if [ ! -e ${FJL} ]; then
    tms; echo "File [ ${FJL} ] NOT found!"
    echo
    exit
fi

# test if dest file already exists
if [ -e ${FJLPDF} ]; then
    tms; echo "File [ ${FJLPDF} ] already exists!"
    echo
    exit
fi

tms; echo "Source file: [ ${FJL} ]"
tms; echo "PS file: [ ${FJLPS} ]"
tms; echo "Destination file: [ ${FJLPDF} ]"
tms; echo "Converting ..."
enscript -v -f "Consolas8" -F "Consolas8" --header='$n||Page $% of $=' -p ${FJLPS} ${FJL}
ps2pdf ${FJLPS} ${FJLPDF}

tms; echo "Removing *.ps file ..."
rm -v ${FJLPS}

tms; echo "Done"