#! /usr/bin/env bash

# way-1
# if [ $# -lt 1 ]; then
# 	echo "Nothing being piped to me"
# 	exit
# else
# 	echo "This has been piped to me: $1"
# fi

# way-2
# if [ -t 0 ]; then
# 	echo "Nothing being piped to me"
# 	exit
# else
# 	cat > OUTPUT
# 	echo "This has been piped to me: $OUTPUT"
# fi

# way-3
if [ ! -p /dev/stdin ]; then
	echo "Nothing being piped to me"
	exit
else
	echo "This has been piped to me: $(cat)"
fi

