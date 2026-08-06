
debug() {
	# must be redirected to stderr, otherwise it would end up inside bmp image data ...
	echo '[DEBUG]' "$@" >&2
}

# Usage:
debug "handled row ${y}/${height}"

