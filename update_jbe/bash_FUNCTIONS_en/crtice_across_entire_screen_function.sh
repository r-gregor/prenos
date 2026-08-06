
# FUNCTION THAT DRAWS LINE ACROSS THE ENTIRE SCREEN
crtice() {
	printf "%$(tput cols)s\n" |tr " " "-"
}

