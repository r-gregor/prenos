
# get_ppid() { printf `awk -F "PPid:" '{print $2}' "/proc/$1/status"` ; }
get_ppid() { printf $(awk -F "PPid:" '{print $2}' "/proc/$1/status") ; }

get_terminal_name() {
	ppid=$(get_ppid $PPID)

	while [[ -z "$term" ]] ; do
		name=$(cat /proc/$ppid/comm)

		case ${name// } in
			"${SHELL/*\/}"|"sh"|"su"* ) ;;

			*)
				echo $name
				break
			;;
		esac
	done
}

# Usage
TERMINAL=$(get_terminal_name)
echo "'${TERMINAL}'"

