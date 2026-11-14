#! /usr/bin/env bash
# === FUNCTIONS ===

# === GLOBALS ===
torent_dir="${HOME}/majstaf/majmedia/_yts_torrents"
unset found_torrents
declare -a found_torrents

# === MAIN ===
if [ ! $PWD == ${torent_dir} ]; then
	echo -e "[e] must be in \"${torent_dir}\"\n"
	echo
	exit
fi

readarray -t found_torrents < <(find _NOVO/ -iname "*\.torrent" | sed 's/_NOVO\///' | sed 's/ \[.*//')

if [ "${#found_torrents[@]}" -le 0 ]; then
	printf "[!] no torrents found\n\n"
	exit 1
else
	printf "[i] movies not downloaded yet or not updated to _DSVM.txt:\n"
	for torrent in "${found_torrents[@]}"; do
		unset found
		found=0
		while read -r MV; do
			if [[ "${torrent,,}" == "${MV,,}" ]]; then
				((found++))
			else
				continue
			fi
		done < ../_DSVM.txt
		if [ $found -eq 0 ]; then
			printf "   '%s'\n" "${torrent}"
		else
			continue
		fi
	done
fi




# while read MV; do grep --color "$MV" ../_DSVM.txt; done < <(ls -1 | grep -v NOVO | sed 's/ \[.*//')
# while read MV; do
# 	grep "$MV" ../_DSVM.txt
# done < <(find _NOVO/ -iname "*\.torrent" | sed 's/_NOVO\///' | sed 's/ \[.*//')

printf "\n"
