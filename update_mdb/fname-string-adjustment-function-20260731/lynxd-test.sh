#! /usr/bin/env bash
# fname: lynxd-test.sh
# v1_20250925 remove option to use dumplist
# v2 20260731 implement fname_string_adjustment function
#             add prefix option
# last: 20260731
# ---

###  EN-proxy ...
# prx_ip=172.17.3.64
prx_ip=10.91.8.21
export http_proxy=http://${prx_ip}:80/
export ftp_proxy=ftp://${prx_ip}:8021/
export https_proxy=http://${prx_ip}:80/

fname_string_adjustment() {
	today=$(date +"%Y%m%d")
	fname_str="$1"
	fname_str_updated=$(echo "${fname_str}" | \
		sed "s/[:]\+//" | \
		sed "s/[;]\+//" | \
		sed "s/[.]\+//" | \
		sed "s/[,]\+//" | \
		sed "s/[?]\+//" | \
		sed "s/[@]\+//" | \
		tr '[[:upper:]]' '[[:lower:]]' | \
		sed "s/  */-/g" | \
		sed "s/-\{2,\}/-/g"
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

