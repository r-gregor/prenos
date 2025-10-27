#! /bin/bash

while read line; do sudo ln -sv "$line" /home/spela/Movies/; done < <(ls -1d ~/majfajls/FILMCKI/iz_KORUZE/Movies/*)
