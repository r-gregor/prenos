
load_links_into_array() {
	while IFS=';' read key value; do
		majlinks["${key}"]="${value}"
	done < ${fname}
}

declare -A majlinks

# Usage
# fname with records separated with ';':
#    https://link1.com/some-page1.html;Description of some-page1
#    https://link2.com/some-page2.html;Description of some-page2
#    ...
#


