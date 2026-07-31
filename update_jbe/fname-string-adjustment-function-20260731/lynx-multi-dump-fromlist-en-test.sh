#! /usr/bin/env bash
# filename: lynx-multi-dump-fromlist-en.sh
# v1_20250925 remove option to use dumplist
# v2 20260731 implement fname_string_adjustment function
#             add prefix option
# last: 20260731
# ---

# EN-proxy ...
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

