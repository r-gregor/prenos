### oneliner to read a list of webpages links from a file and inserts them to single text file:
### reads from: _exfat-list.txt
### writes to:  ${gr_filename} 

# Initialising global variables ...
gr_seznam="$HOME/majfajls/coding/lynxdump/_multi_dump_list.dat"

gr_dest="$PWD"
gr_d_filename="default-filename"

### FILENAME - MUST CREATE!! ###

# dtae in num-fprm: yyyymmdd ...
gr_dejt=$(date +%Y%m%d)


echo "Enter filename [no spaces, only hypens or underscores] :"
read gr_ANS

# filename to add html-dumps to ...
if [ -z ${gr_ANS} ]; then 
	
	gr_filename=${gr_d_filename}-multyf_${gr_dejt}.txt
else
	gr_imef=$(echo "${gr_ANS}" | tr ' ' '-') 
	gr_filename=${gr_imef}-multyf_${gr_dejt}.txt
fi

# destination ...
gr_goto="${gr_dest}/${gr_filename}" 
echo "Destination: ${gr_goto}"

# If OK pres any key, else ctrl-c ...
read -p "Continue ?"
touch ${gr_goto}


### for FFF in $(cat _exfat-list.txt); do echo -e "$FFF\n" >> ${gr_dest}/${gr_filename}; lynx -dump -width=100 $FFF >> ${gr_dest}/${gr_filename}; echo -e "\n\n---\n" >> ${gr_dest}/${gr_filename}; done

for FFF in $(cat ${gr_seznam}); do echo -e "$FFF\n" >> ${gr_goto}; lynx -dump -width=100 $FFF >> ${gr_goto}; echo -e "\n\n---\n" >> ${gr_goto}; done

for FFF in $(cat ${gr_seznam}); do echo "inserting $FFF into ${gr_goto}"; done


echo
echo 'DONE!'
echo

