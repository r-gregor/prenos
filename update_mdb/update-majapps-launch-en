#! /usr/bin/env bash
# filename: majapps-launch.sh
# 20250917 en
# 20250919 en v1 added runff var for firefox path
# 20251017 en v2 run inside infinite loop and added 'q' to quit
#                keys in separate index-ed array to keep display order
# 20260317 en v3 $delline calculated from longest KEY line with get_longest function
#                sorted output to fzf command
#                extract KEYS from URLS
# 20260325 en v4 case statement instead of 'if/elif/then' block
# 20260408 en v5 added continue in if block for OneCommander, so thai it does not print "selected ..." twice
#                as rule inside case statement
# 20260423 en v6 put all RUN statemnets into majaps_run() function and add option to select input as parameter
# last: 20260423
# ---

runff="/c/Users/gregor.redelonghi/majstaf_en/majprogs_en/FireFox_63.0.1/FirefoxPortable.exe"
runedg="/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe"
moffpth='/c/Program Files/Microsoft Office/root/Office16' #v4

# v4 from "Mintty till end"
declare -A apps=(["Firefox"]="/c/Users/gregor.redelonghi/majstaf_en/majprogs_en/FireFox_63.0.1/FirefoxPortable.exe" \
                 ["MS Edge"]="$(cygpath -w /c/Program\ Files\ \(x86\)/Microsoft/Edge/Application/msedge.exe)" \
                 ["Google Chrome"]="C:\Program Files\Google Chrome Portable\GoogleChromePortable.exe" \
                 ["MS Calc"]="/c/Windows/System32/calc.exe" \
                 ["Acrobat Reader"]="C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe"
                 ["AutoCAD 2024"]=""
                 ["Explorer++"]="/c/Users/gregor.redelonghi/majstaf_en/majprogs_en/Explorerpp/Explorer++.exe" \
                 ["OneCommander - D2"]="D2"
                 ["OneCommander - D3"]="D3"
                 ["OneCommander - D4"]="D4"
                 ["Notepad++"]="/c/Users/gregor.redelonghi/majstaf_en/majprogs_en/Notepad++/notepad++.exe" \
                 ["MultiCommander"]="/c/Users/gregor.redelonghi/majstaf_en/majprogs_en/MultiCommander_X64/MultiCommander.exe"
                 ["Super Launcher"]="c:\Users\Public\below average\Super Launcher\SuperLauncher.exe" \
                 ["Nukleus (EN)"]="" \
                 ["URE"]="" \
                 ["Razvojne Rešitve (EN)"]="" \
                 ["Mintty"]="" \
                 ["MS Excel"]="${moffpth}/EXCEL.EXE" \
                 ["MS Word"]="${moffpth}/WINWORD.EXE" \
                 ["MS Powerpoint"]="${moffpth}/POWERPNT.EXE" \
                 ["MS Outlook"]="${moffpth}/OUTLOOK.EXE" \
)

# array of keys from apps
keys=("${!apps[@]}") # v3

# functions #v3
get_longest() {
	if [ ! $# -eq 1 ]; then
		echo "[ERROR1] must supply array of sentences as parameter"
		exit 1
	fi

	local len=0
	local longest
	local -n lines2=$1 # new way: must call array as < array_name >

	for line in "${lines2[@]}"; do
		llen="${#line}"
		if [ "${llen}" -gt "${len}" ]; then
			len="${llen}"
			longest="${line}"
		else
			continue
		fi
	done

	echo "${longest}"
}

selection_info() {
	printf "[INFO] selected: $1\n"
}

# v6
majaps_run() {
	if [ "x${selection}" == "x" ]; then
		echo -e "[INFO] no selection\n"
		exit
	fi

	case "${selection}" in #v4
		"AutoCAD 2024")
			cygstart "C:\Program Files\Autodesk\AutoCAD 2024\acad.exe"  /product ACAD /language "en-US" &>/dev/null
			selection_info "${selection}"
			;;

		"Nukleus (EN)")
			${runff} "http://jpe-nukleus.jhl.si/PassAuth/AutoAuth.aspx?ReturnUrl=/nukleus/profile.aspx?id=Energetika@Ljubljana"
			selection_info "${selection}"
			;;

		"Razvojne Rešitve (EN)")
			${runff} "https://jpe-arcgis-port.jhl.si/arcgis/apps/webappviewer/index.html?id=b7ec743d0247439fbe941cb6187fa094"
			selection_info "${selection}"
			;;

		"Mintty")
			# cygstart /c/users/gregor.redelonghi/majstaf_en/majprogs_en/cygwin64/bin/mintty.exe -p 300,40 -s 180,40 -
			cygstart /c/users/gregor.redelonghi/majstaf_en/majprogs_en/cygwin64/bin/mintty.exe -s 180,40 -
			selection_info "${selection}"
			;;

		"URE")
			jhl_ure="https://ris.jhl.si/"
			# cygstart "${runedg}" ${jhl_ure}
			"${runedg}" ${jhl_ure}
			selection_info "${selection}"
			;;

		"Quit")
			exit
			;;
		*)
			cygstart "${apps["${selection}"]}" &>/dev/null
			selection_info "${selection}"
			;;
	esac
}

# MAIN

# v6
if [ $# -eq 1 ]; then
	# ${varname,,} -- convert string to all lowercase ...
	selection=$((for key in "${keys[@]}"; do if [[ "${key,,}" =~ "${1,,}" ]]; then echo ${key}; fi; done) | \
		fzf \
		-e \
		--reverse \
		-i \
		--prompt="launch: ")
	
	if [[ "${selection}" =~ "OneCommander" ]]; then #v4
		cygstart "c:\Users\gregor.redelonghi\majstaf_en\majprogs_en\OneCommander\OneCommander.exe" -openwin "${apps[${selection}]}"
		selection_info "${selection}"
		# continue # v6 -- (this instance not inside loop)
	fi
	majaps_run
	exit
fi


longest_l=$(get_longest keys)                                         # v3
delline=$(for((i = 0; i < ${#longest_l}; i++)); do printf "-"; done)  # v3

while true; do
	selection=$((for key in "${!keys[@]}"; do echo "${keys[$key]}"; done | sort; echo "${delline}"; echo "Quit") | \
		fzf \
		-e \
		--reverse \
		-i \
		--prompt="launch: ")


	# RUN
	if [ "${selection}" == "${delline}" ]; then #v3
		continue
	elif [[ "${selection}" =~ "OneCommander" ]]; then #v4
		cygstart "c:\Users\gregor.redelonghi\majstaf_en\majprogs_en\OneCommander\OneCommander.exe" -openwin "${apps[${selection}]}"
		selection_info "${selection}"
		continue # v5
	fi
	majaps_run # v6

done

