#! /usr/bin/env bash
# fname: arrays-update-tests.sh
# from: Bash Nameref: Mutate Function Arguments (Pointer-Like Behavior)
#       https://www.youtube.com/watch?v=nvfQc8yhoGY
# 20260811 v1
# last: 20260811
# ---

crossline() {
	printf "%.0s-" $(seq 1 $(tput cols))
	printf "\n"
}

# section 1: GLOBAL
# simple array update using global variable:
FRUITS1=("apple" "banana")

add_fruit1() {
	FRUITS1+=("${1}")
}

# main1
printf "Original contents of FRUITS1 array: '%s'\n" "${FRUITS1[*]}"
printf "Updating FRUITS1 with element 'cherry' using the global var FRUITS1 ...\n"

#update array command:
add_fruit1 "cherry"

printf "Updated contents of FRUITS1 array: '%s'\n" "${FRUITS1[*]}"

crossline # --------------------------------------------------------------------------

# section 2: SUBSHELL
# array update using subshell to avoid global variable
FRUITS2=("apple2" "banana2")


# global var FRUITS2 is never used inside function
add_fruit2() {
	local new_fruit=("${1}")

	shift

	local -a fruits=("${@}")
	fruits+=("${new_fruit[@]}")

	echo "${fruits[@]}"
}

# main2
printf "Original contents of FRUITS2 array: '%s'\n" "${FRUITS2[*]}"
printf "Updating FRUITS2 with element 'cherry' using subshell ...\n"

# update array command:
# FRUITS2 is reconstrucrted (owerridden)
# mapfile --> readarray
mapfile -t FRUITS2 < <(add_fruit2 "cherry2" "${FRUITS2[@]}")

printf "Updated contents of FRUITS2 array: '%s'\n" "${FRUITS2[*]}"

crossline # --------------------------------------------------------------------------

# section 3: NAMEREF
# array update passing a variable name as reference
FRUITS3=("apple3" "banana3")

# function does NOT reference global array FRUITS3 but uses its name:
add_fruit3() {
	# reference fruits as name - positional parameter #2: ('FRUITS3')
	local -n fruits="${2}"

	# add element as positional parameter #1
	fruits+=("${1}")
}

# main3
printf "Original contents of FRUITS3 array: '%s'\n" "${FRUITS3[*]}"
printf "Updating FRUITS3 with element 'cherry3' using NAMEREF ...\n"

# update array command:
# 1-st parameter: element to add
# 2-nd parameter: name of the variable to be mutated
add_fruit3 "cherry3" "FRUITS3"

printf "Updated contents of FRUITS3 array: '%s'\n" "${FRUITS3[*]}"

crossline # --------------------------------------------------------------------------

# section 4: circular
# array update passing a variable name as reference, but using same name for reference variable
# and referenced variable --> circular reference error
FRUITS4=("apple4" "banana4")

# function does NOT reference global array FRUITS4 but uses its name:
add_fruit4() {
	# reference fruits as name - positional parameter #2: ('FRUITS4')
	# using same name in function as reference name causes a circular reference error!!
	# so it has to be done as in section 3
	local -n FRUITS4="${2}"

	# add element as positional parameter #1
	FRUITS4+=("${1}")
}

# main
printf "Original contents of FRUITS4 array: '%s'\n" "${FRUITS4[*]}"
printf "Updating FRUITS4 with element 'cherry4' using NAMEREF ...\n"

# update array command:
add_fruit4 "cherryr4" "FRUITS4"

printf "Updated contents of FRUITS4 array: '%s'\n" "${FRUITS4[*]}"

# OUTPUT:
# Original contents of FRUITS4 array: 'apple4 banana4'
# Updating FRUITS4 with element 'cherry4' using NAMEREF ...
# ./arrays-update-tests.sh: line 90: local: warning: FRUITS4: circular name reference
# ./arrays-update-tests.sh: line 90: warning: FRUITS4: circular name reference
# ./arrays-update-tests.sh: line 93: warning: FRUITS4: circular name reference
# Updated contents of FRUITS4 array: 'apple4 banana4 cherryr4'

crossline # --------------------------------------------------------------------------
printf "\n"

