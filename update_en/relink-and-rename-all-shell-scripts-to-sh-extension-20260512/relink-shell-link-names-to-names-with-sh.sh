#! /usr/bin/env bash

# while IFS=';' read link spath; do printf "%-30s --> %s\n" "${link}" "${spath}"; done < sflinks.txt

ULB="${HOME}/.local/bin"

while IFS=';' read slink spath; do
	# printf "spath: %s\n" "${spath}.sh"
	if [ -f "${spath}.sh" ]; then
		# TEST
		printf "ln -snf ${spath}.sh ${ULB}/${slink}\n"
		printf "mv -v ${ULB}/${slink} ${ULB}/${slink}.sh\n"
		#REAL DEAL
		# ln -snf "${spath}.sh" "${ULB}/${slink}"
		# mv -v "${ULB}/${slink}" "${ULB}/${slink}.sh"
	fi
done < sflinks.txt

