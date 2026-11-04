#! /usr/bin/env bash
# fname: gt-reclone-testing-repostories.sh
# descpt: reclone testing repository
# 20261104 v1
# last: 20261104
# ---


# === GLOBALS ===
# /home/rgregor/majstaf/coding2/testing/c_testing
# /home/rgregor/majstaf/coding2/testing/go_testing
# /home/rgregor/majstaf/coding2/testing/java_testing
# /home/rgregor/majstaf/coding2/testing/ncurses_testing
# /home/rgregor/majstaf/coding2/testing/python_testing
# /home/rgregor/majstaf/coding2/testing/rust_testing
# /home/rgregor/majstaf/coding2/testing/zig_testing
testing_dir="${HOME}/coding2/testing"
gthb_url="https://github.com/r-gregor"
gtlb_url="https://gitlab.com/r-gregor"
gthb_ssh_dest="git@github.com:r-gregor"
gtlb_ssh_dest="git@gitlab.com:r-gregor"

# === FUNCTIONS ===
git_reclone() {
	local dist
	if [ $# -ne 1 ]; then
		printf "[e] no option given\n\n"
		exit 1
	else
		opt="${1}"

	fi

	git_dest="${gthb_url}/${opt}_testing.git"
	git clone "${git_dest}"
	cd "${opt}_testing"
	/usr/bin/git remote add "gh${opt}tst" "${gthb_ssh_dest}/${opt}_testing.git"
	/usr/bin/git remote add "gl${opt}tst" "${gtlb_ssh_dest}/${opt}_testing.git"
	/usr/bin/git remote rm origin

	# printf "[i] remotes:\n"
	# while read -r LINE do;
	# 	printf "\t%s\n" "${LINE}"
	# done < <(/usr/bin/git remote -v)
	/usr/bin/git remote -v

	printf "\n"
}



# === MAIN ===
while getopts "cgjnprz" opt; do
	case $opt in
		c)
			git_reclone c
		;;

		g)
			git_reclone go
		;;

		j)
			git_reclone java
		;;

		n)
			git_reclone ncurses
		;;

		p)
			git_reclone python
		;;

		r)
			git_reclone rust
		;;

		z)
			git_reclone zig
		;;

		*)
			printf "[e] no such selection\n\n"
			exit 1
		;;
	esac
done

printf "\n"

