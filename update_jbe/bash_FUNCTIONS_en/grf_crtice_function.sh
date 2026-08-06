#!/bin/bash

### ------------------------------------------------------------------------
### name:       gooo.sh
### author:     RgregoR, 2014
### date:       20141218
### ------------------------------------------------------------------------
### script:     shell script replacement for CDARGS  
### ------------------------------------------------------------------------
### ATTENTION!!!
### YOU MUST SOURCE THIS FILE TO MAKE IT WORK!!!
### THE BEST WAY IS TO MAKE AN ALIAS:
### alias goo='source $HOME/majstaf/coding/gooo.sh'
### ------------------------------------------------------------------------

clear


# CHANGING IFS TO NEWLINE
gr_OLDIFS=$IFS
IFS=$'\n'

# FUNCTION THAT DRAWS LINE ACROSS THE ENTIRE SCREEN
function grf_crtice() {
	printf "%87s\n" | tr " " "-"
}	

# LOAD CONTENTS OF AFILE INTO THE ARRAY, LINE BY LINE
gr_SEZNAM=( $(< "$HOME/majstaf/coding/gooo/godirs.conf" ) )

# DISPLAY AUTONUMBERED MENU
echo "($USER) - APPLICATIONS LIST: "
grf_crtice # ---------------------------------------------------
for AAA in $(seq 0 $((${#gr_SEZNAM[*]}-1)))
	do echo "$((${AAA}+1))) ${gr_SEZNAM[$AAA]}"
done
grf_crtice # ---------------------------------------------------
echo '0) [exit]'
grf_crtice # ---------------------------------------------------

# SET THE IFS TO ORIGINAL VALUE
IFS=${gr_OLDIFS}

# READ THE USER INPUT (SELECTION)
read -ep "Select the number before the required application > "


gr_SLCTN=$REPLY
gr_POINTER=$((${gr_SLCTN}-1))

# IF NUMBER IS GREATER THAN MAX LIST NUM
if [[ "${gr_SLCTN}" -gt "${#gr_SEZNAM[*]}" ]]; then ### QUOTES ARE IMPORTANT ###
	clear
	echo "You entere number greater than ${#gr_SEZNAM[*]}. Bye!"
	
elif [[ ${gr_SLCTN} != [0-9]* ]]; then # IF SELECTION IS NOT AN INTIGER
	clear
	echo "You entered wrong number or selection that doesnt exist. Bye!"

elif [[ ${gr_SLCTN} == 0 ]]; then
	clear
	echo "Bye!"


else	# GO
	gr_POT="${gr_SEZNAM[${gr_POINTER}]}"
	clear
	cd "${gr_POT}"
	### ls -AF --color
fi
