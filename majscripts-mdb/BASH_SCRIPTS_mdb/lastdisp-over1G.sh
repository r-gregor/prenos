# cat 30.najvecjih_2013-05-07.1205.txt | grep -v '^ ' | grep -E 'G./' | sed 's|/$||' | sort -hr | uniq -u
gr_START=/home/rgregor/majfajls/coding

clear
echo
echo "displaying files/dirs with size over 1GB ..."
echo
${gr_START}/last-disp.sh | sed 's|/$||' | grep -E 'G./' | sort -hr |sed '/ .*\(.G\)/p' | uniq -u
