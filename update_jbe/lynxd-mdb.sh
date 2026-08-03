#! /usr/bin/env bash
# fname: lynxd.sh
# v1_20250925 remove option to use dumplist
# v2 20260731 implement fname_string_adjustment function
#             add prefix option
# last: 20260731
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

	printf "${fname_str_updated}-${today}.txt"
}

usage() {
	printf "\n\tUSAGE: <scriptmname> [web-URL] \"[fname inside double quotes]\" [prefix: c, go, bash, ...(optional)]\n\n"
}

# MAIN
clear

if [ $# -lt 2 ]; then
	usage
	exit 1
fi

if [ $# -eq 2 ]; then
	weburl="$1"
	flnm=$(fname_string_adjustment "$2")
elif [ $# -eq 3 ]; then
	weburl="$1"
	pfnm=$(fname_string_adjustment "$2")
	flnm="${3}-${pfnm}"
else
	usage
	exit 1
fi


printf "[INFO] %-10s%s\n" "Web URL:" "${weburl}"
printf "[INFO] %-10s%s\n" "filename:" "${flnm}"

printf "[INFO] Press <enter> to proceed or <ctrl-c> to quit"
read ANS

# echo "filename: ${flnm}" >> ${flnm}
# echo -e "${weburl}\n\n" >> ${flnm}
printf "filename: ${flnm}\n" >> ${flnm}
printf "${weburl}\n\n" >> ${flnm}
lynx -dump -width=110 ${weburl} >> ${flnm}
echo -e "\n\n---\n" >> ${flnm}

printf "[INFO] done\n"

#################################################################
# gr_weburl="$1"
# gr_fjl="$2"
# gr_flnm="${gr_fjl}-${today}.txt"
# 
# printf "%-20s%s\n" "Web URL:" "${gr_weburl}"
# printf "%-20s%s\n\n" "filename:" "${gr_flnm}"
# 
# read -p "Press <enter> to proceed or <ctrl-c> to quit"
# 
# echo "filename: ${gr_flnm}" >> ${gr_flnm}
# echo -e "${gr_weburl}\n\n" >> ${gr_flnm}
# lynx -dump -width=110 ${gr_weburl} >> ${gr_flnm}
# echo -e "\n\n---\n" >> ${gr_flnm}
# 
# echo
# echo -e 'DONE!\n'
# 
#################################################################
