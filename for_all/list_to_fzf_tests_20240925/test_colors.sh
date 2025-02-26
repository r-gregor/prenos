#! /usr/bin/env bash


desc="\n\tTest of piping a vertical list into 'fzf' to make\n
\ta selection. On Linux 'fzf' could be replaced\n
\twith dmenu:\n
\t\t\"\$(<command, or list ...> | dmenu -l 10 -p \"Choice: \")\""



if [ $# -eq 1 ]; then
	echo -e $desc
	exit
fi




case "$(cat ./colors | fzf --reverse)" in
	"red") echo "red" ;;
	"green") echo "green" ;;
	"blue") echo "blue" ;;
	"yellow") echo "yellow" ;;
	"magenta") echo "magenta" ;;
	"cyan") echo "cyan" ;;
	"pink") echo "pink" ;;
	*) echo "WTF?" ;;
esac


