#! /usr/bin/env bash
# fname: bash-arrays-testing.sh
# 20260807 v1
# last 20260807
# ---

info_print() {
	printf -- "%.0s-" {1..80}
	printf "\n"
	printf "[INFO] "
	printf "$@"
	printf ':'
	printf "\n"
}

print_PRE() {
	printf '\t'
	printf "$@"
	printf '\n'
}


unset array
info_print "printing array declared with 'a'"
print_PRE 'declare -a array=(1 2 3 foo 4)'
declare -a array=(1 2 3 foo 4)
printf '<%s>\n' "${array[@]}"
# --------------------------------------------------------------------------------
# [INFO] printing array declared with 'a':
# 	declare -a array=(1 2 3 foo 4)
# <1>
# <2>
# <3>
# <foo>
# <4>

unset array
info_print "printing array declared with 'ai'"
print_PRE 'declare -ai array=(1 2 3 foo 4)'
declare -ai array=(1 2 3 foo 4)
printf '<%s>\n' "${array[@]}"
# --------------------------------------------------------------------------------
# [INFO] printing array declared with 'ai':
# 	declare -ai array=(1 2 3 foo 4)
# <1>
# <2>
# <3>
# <0>
# <4>

unset array
info_print "printing array of numbers declared with 'a'"
print_PRE 'declare -a array=(0x00 0x01 0xFF)'
declare -a array=(0x00 0x01 0xFF)
printf '<%s>\n' "${array[@]}"
# --------------------------------------------------------------------------------
# [INFO] printing array of numbers declared with 'a':
# 	declare -a array=(0x00 0x01 0xFF)
# <0x00>
# <0x01>
# <0xFF>

unset array
info_print "printing array of numbers declared with 'ai'"
print_PRE 'declare -ai array=(0x00 0x01 0xFF)'
declare -ai array=(0x00 0x01 0xFF)
printf '<%s>\n' "${array[@]}"
# --------------------------------------------------------------------------------
# [INFO] printing array of numbers declared with 'ai':
# 	declare -ai array=(0x00 0x01 0xFF)
# <0>
# <1>
# <255>

unset AARR
info_print "printing ASSOC AARR declared with 'A'"
print_PRE 'declare -A AARR=([one]=1 [two]=2 [three]=3 [four]=4 [five]=5 [six]=6 [seven]=7)'
declare -A AARR=([one]=1 [two]=2 [three]=3 [four]=4 [five]=5 [six]=6 [seven]=7)
printf '<%s>\n' "${AARR[@]}"
# --------------------------------------------------------------------------------
# [INFO] printing ASSOC AARR declared with 'A':
# 	declare -A AARR=([one]=1 [two]=2 [three]=3 [four]=4 [five]=5 [six]=6 [seven]=7)
# <4>
# <7>
# <2>
# <3>
# <6>
# <1>
# <5>


unset AARR
info_print "printing ASSOC AARR declared with 'A'"
print_PRE 'declare -A AARR=(one 1 two 2 three 3 four 4 five 5 six 6 seven 7)'
declare -A AARR=(one 1 two 2 three 3 four 4 five 5 six 6 seven 7)
printf '<%s>\n' "${AARR[@]}"
# --------------------------------------------------------------------------------
# [INFO] printing ASSOC AARR declared with 'A':
# 	declare -A AARR=(one 1 two 2 three 3 four 4 five 5 six 6 seven 7)
# <4>
# <7>
# <2>
# <3>
# <6>
# <1>
# <5>

unset AARR
info_print "printing ASSOC AARR declared with 'A'"
print_PRE 'declare -A AARR=([one]=0x01 [two]=0x02 [three]=0x03 [four]=0x04 [five]=0x05 [six]=0x06 [seven]=0x07)'
declare -A AARR=([one]=0x01 [two]=0x02 [three]=0x03 [four]=0x04 [five]=0x05 [six]=0x06 [seven]=0x07)
printf '<%s>\n' "${AARR[@]}"
# --------------------------------------------------------------------------------
# [INFO] printing ASSOC AARR declared with 'A':
# 	declare -A AARR=([one]=0x01 [two]=0x02 [three]=0x03 [four]=0x04 [five]=0x05 [six]=0x06 [seven]=0x07)
# <0x04>
# <0x07>
# <0x02>
# <0x03>
# <0x06>
# <0x01>
# <0x05>

unset AARR
info_print "printing ASSOC AARR declared with 'Ai'"
print_PRE 'declare -Ai AARR=([one]=0x01 [two]=0x02 [three]=0x03 [four]=0x04 [five]=0x05 [six]=0x06 [seven]=0x07)'
declare -Ai AARR=([one]=0x01 [two]=0x02 [three]=0x03 [four]=0x04 [five]=0x05 [six]=0x06 [seven]=0x07)
printf '<%s>\n' "${AARR[@]}"
# --------------------------------------------------------------------------------
# [INFO] printing ASSOC AARR declared with 'Ai':
# 	declare -Ai AARR=([one]=0x01 [two]=0x02 [three]=0x03 [four]=0x04 [five]=0x05 [six]=0x06 [seven]=0x07)
# <4>
# <7>
# <2>
# <3>
# <6>
# <1>
# <5>

unset AARR
info_print "printing ASSOC AARR declared with 'Ai'"
print_PRE 'declare -Ai AARR=(one 0x01 two 0x02 three 0x03 four 0x04 five 0x05 six 0x06 seven 0x07)'
declare -Ai AARR=(one 0x01 two 0x02 three 0x03 four 0x04 five 0x05 six 0x06 seven 0x07)
printf '<%s>\n' "${AARR[@]}"
# --------------------------------------------------------------------------------
# [INFO] printing ASSOC AARR declared with 'Ai':
# 	declare -Ai AARR=(one 0x01 two 0x02 three 0x03 four 0x04 five 0x05 six 0x06 seven 0x07)
# <4>
# <7>
# <2>
# <3>
# <6>
# <1>
# <5>


# --- END
printf "\n"

