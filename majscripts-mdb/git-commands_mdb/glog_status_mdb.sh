#! /usr/bin/env bash
# glog_status_mdb
# last change: 20240821

# for myopt in raw numstat shortstat dirstat summary name-only name-status check; do
# 	echo -e "*** git log --${myopt} ***"
# 	git log --${myopt} | head -n 15
# 	echo -e "---\n"
# done

if [ -d .git ] || [ -f HEAD ]; then
	/usr/bin/git log --name-status
else
	echo "NOT a git repository!!"
	exit
fi

