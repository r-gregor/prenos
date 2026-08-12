#! /usr/bin/env bash
# fname: references-namerefs-indirection-examples.sh
# examples from: bash-references-namerefs-indirection-declare-20260811.txt
#                https://blogsh.github.io/2018/06/29/references-in-bash.html
# 20260812 v1
# ---

sep() {
	printf -- "-----------------\n"
}

end_main() {
	printf "[INFO] read the source '*.sh' file for explanation\n"
	printf "\n"
}

# MAIN ========================

# Here, thanks to dynamic scope we can call increment1 function to modify a variable for us. This has
# obviously one issue - we can only increment variable called 'x'

increment1() {
	((x++))
}

foo1() {
	local x=3
	increment1
	printf "foo(): %d\n" $x
}

bar1() {
	local x=5
	increment1
	printf "bar(): %d\n" $x
}

foo1  # 4
bar1  # 6
sep

# -----------------------------
# We need a way to specify which variable from parent scope the increment function should change. So we
# must do something like this:

increment2() {
	(("$1"++))
}

foo2() {
	local x=3
	increment2 x
	printf "foo2(): %d\n" $x
}

foo2 # 4
sep

# -----------------------------
# Great! This will work. We have passed a variable by reference! This is awesome. But, let´s try
# another example. A function which will capitalize all letters. This can be easily done with tr
#
# 	$> tr '[[:lower:]]' '[[:upper:]]'
#
# And the function:

 capitalize3() {
 	#here the ${!1} is syntax for $$1 - indirect variable reference
 	$1="$(echo "${!1}" | tr '[[:lower:]]' '[[:upper:]]')"
 }


 foo3() {
 	local hello="hello world"
 	capitalize3 hello #pass by reference
 	echo "$hello"
 }

# But this won´t work. It will print:
# foo3 # ./increment.sh: line 44: hello=HELLO WORLD: command not found
#      # hello world

foo3
sep
# -----------------------------
# We can somehow overcome this issue. You have probably already seen the read built in.
# 	read -p "Please provide a name" name
#
# It is going to read string from standard input into a variable called name. So? How can we use read
# to pass parameters by reference? Let´s implement the capitalize4 function again

capitalize4() {
	#here the ${!1} is syntax for $$1 - indirect variable reference
	IFS= read "$1" <<< "$(echo "${!1}" | tr '[[:lower:]]' '[[:upper:]]')"
}

# Let´s break it up a little bit:
#   * $1 is the first argument - here the name of variable passed by reference
#   * ${!1} is the value of variable passed by reference
#   * $(echo "${!1}" | tr '[[:lower:]]' '[[:upper:]]') - passes the value of the variable on tr stdin,
#     which will change all lowercase character to uppercase and print the result on stdout
#   * <<< is the HERESTRING syntax, which will pass the string on right side the stdin of read builtin.
#   * IFS= is the internal field separator, it is set to "" to prevent read from stripping whitespace
#
# Note that we can´t just pipe the tr output to read like this:
# 	echo ${!1} | tr '[[:lower:]]' '[[:upper:]]' | read "$1"
# because each command in pipeline is executed in a subshell, thus read would be unable to modify our
# environment, because it would be called in a child process.

foo4() {
	local hello="hello world"
	capitalize4 hello #pass by reference
	echo "$hello"
}

foo4
sep

# -----------------------------
# Turns out we don´t even need the read function. Bash 4.3 introduced support for "namerefs" which is
# exactly what we need to make our solution less hacky.
#
# From bash manual:
# Whenever the nameref variable is referenced, assigned to, unset, or has its attributes modified
# (other than using or changing the nameref attribute itself), the operation is actually performed
# on the variable specified by the nameref variable´s value. A nameref is commonly used within shell
# functions to refer to a variable whose name is passed as an argument to the function.
#
# This means we can use namerefs in our capitalize5 function instead of read:

capitalize5() {
	local -n _ref="$1"
	_ref="$(echo "$_ref" | tr '[[:lower:]]' '[[:upper:]]')"
}

foo5() {
	local hello="hello world"
	capitalize5 hello #pass by reference
	echo "$hello"
}

foo5
sep

# -----------------------------
# One thing which namerefs have that read does not is natural support for arrays:

append6() {
	local -n _ref="$1"; shift || return
	_ref+=("$1")
}

main6() {
	local -a numbers=(1 2 3)
	echo "original array: ${numbers[@]}"
	append6 numbers 4
	append6 numbers 5
	echo "updated: array: ${numbers[@]}"
}

main6 "$@"
sep
end_main

# Caveats
# The first problem can occur when the callee uses the same variable name for nameref as the variable
# passed by reference
# When this situation occurs, bash will report an error.
#
# Another problem can occur if the function uses local variable with the same name as the variable
# passed by reference.
# This is due to the fact that namerefs, as the name suggests, operate on variable names and those can
# easily overlap. The only solution to this problem is to limit the amount of local variables in
# functions that use namerefs and prefix the namerefs with '_' for example.
#
#
# ---

