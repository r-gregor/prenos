github-create() {
	repo_name=$1

	dir_name=`basename $(pwd)`

	if [ "$repo_name" = "" ]; then
		echo "Repo name (hit enter to use '$dir_name')?"
		read repo_name
	fi

	if [ "$repo_name" = "" ]; then
		repo_name=$dir_name
	fi

	username=`git config github.user`
	if [ "$username" = "" ]; then
		echo "Could not find username, run 'git config --global github.user <username>'"
		invalid_credentials=1
	fi

	token=`git config github.token`
	if [ "$token" = "" ]; then
		echo "Could not find token, run 'git config --global github.token <token>'"
		invalid_credentials=1
	fi

	if [ "$invalid_credentials" == "1" ]; then
		return 1
	fi

	echo -n "Creating Github repository '$repo_name' ..."
	curl -u "$username:$token" https://api.github.com/user/repos -d '{"name":"'$repo_name'"}' > /dev/null 2>&1
	echo " done."

	echo -n "Pushing local code to remote ..."
	git remote add origin git@github.com:$username/$repo_name.git > /dev/null 2>&1
	git push -u origin master > /dev/null 2>&1
	echo " done."
}

