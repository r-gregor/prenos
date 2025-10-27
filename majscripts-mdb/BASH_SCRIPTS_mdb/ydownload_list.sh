#! /bin/bash

gr_pot=$1
gr_dest=/home/rgregor/majfajls/ydownloads/yDownload-list.txt

echo -n "${gr_pot}" >> ${gr_dest};echo "; \"$(youtube-dl -se ${gr_pot})\"" >> ${gr_dest}



