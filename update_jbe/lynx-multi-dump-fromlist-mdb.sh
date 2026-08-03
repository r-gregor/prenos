#! /usr/bin/env bash

# filename: lynx-multi-dump-fromlist-mdb
# 20250925 v1 en: remove option to use dumplist
# 20251028 v2  d: convert from en to mdb
# 20260803 v3 implement fname_string_adjustment function
#             add prefix option
# last: 20260803
# ---

fname_string_adjustment() {
	today=$(date +"%Y%m%d")
	fname_str="$1"
	fname_str_updated=$(echo "${fname_str}" | \
		sed "s/[:]\+//g" | \
		sed "s/[;]\+//g" | \
		sed "s/[\.]\+//g" | \
		sed "s/[,]\+//g" | \
		sed "s/[\?]\+//g" | \
		sed "s/[\@]\+//g" | \
		sed "s/  */-/g" | \
		sed "s/--*/-/g" | \
		tr '[[:upper:]]' '[[:lower:]]'
	)

	printf "${fname_str_updated}-multif-${today}.txt"
}

usage() {
	printf "\n\tUSAGE: <scriptmname> [list] \"[fname inside double quotes]\" [prefix: c, go, bash, ...(optional)]\n\n"
}

#MAIN

if [ $# -lt 2 ]; then
	usage
	exit 1
fi

if [ $# -eq 2 ]; then
	seznam="$1"
	if [ ! -f $seznam ]; then
		printf "[ERROR] no such file: ${seznam}\n\n"
		exit 1
	fi
	ffname=$(fname_string_adjustment "$2")
elif [ $# -eq 3 ]; then
	seznam="$1"
	if [ ! -f $seznam ]; then
		printf "[ERROR] no such file: ${seznam}\n\n"
		exit 1
	fi
	pfnm=$(fname_string_adjustment "$2")
	ffname="${3,,}-${pfnm}"
else
	usage
	exit 1
fi

dest="$PWD"

# destination ...
fdest="${PWD}"
printf "[INFO] Destination: ${fdest}/${ffname}\n"

# If OK pres any key, else ctrl-c ...
read -p "[INFO] Continue ?"
cd $fdest
touch ${ffname}

printf "filename: ${ffname}\n" >> ${ffname}

for FFF in $(cat ${seznam}); do printf "[INFO] inserting $FFF into ${ffname}\n"; done
for FFF in $(cat ${seznam}); do printf "$FFF\n" >> ${ffname}; lynx -dump -width=110 $FFF >> ${ffname}; echo -e "\n\n\n---" >> ${ffname}; done

printf "[INFO] done\n"


#######################################################################
# if [ $# -eq 1 ]; then
# 	gr_seznam=$1
# 	gr_name="default-fname"
# 	if [ ! -f $gr_seznam ]; then
# 		echo -e "[ERROR] no such file: ${gr_seznam}\n"
# 		exit
# 	fi
# elif [ $# -eq 2 ]; then
# 	gr_seznam=$1
# 	if [ ! -f $gr_seznam ]; then
# 		echo -e "[ERROR] no such file: ${gr_seznam}\n"
# 		exit
# 	fi
# 	gr_name=$2
# else
# 	echo -e " Usage:"
# 	echo -e "      \t$(basename $0) <list> <name>"
# 	echo -e "    or:"
# 	echo -e "      \t$(basename $0) <list> [default-fname]"
# 	echo -e ""
# 	exit
# fi
# 
# gr_dest="$PWD"
# gr_dejt=$(date +%Y%m%d)
# gr_filename=${gr_name}-multif-${gr_dejt}.txt
# 
# # destination ...
# gr_goto="${PWD}"
# echo "Destination: ${gr_goto}/${gr_filename}"
# 
# # If OK pres any key, else ctrl-c ...
# read -p "Continue ?"
# cd $gr_goto
# touch ${gr_filename}
# 
# echo "filename: ${gr_filename}" >> ${gr_filename}
# 
# for FFF in $(cat ${gr_seznam}); do echo "inserting $FFF into ${gr_filename}"; done
# for FFF in $(cat ${gr_seznam}); do echo -e "$FFF\n" >> ${gr_filename}; lynx -dump -width=110 $FFF >> ${gr_filename}; echo -e "\n\n\n---" >> ${gr_filename}; done
# 
# echo
# echo -e "DONE!\n"
# echo
# #####################################################################################
