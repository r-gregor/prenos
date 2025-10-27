#! /bin/bash
### script that replaces spaces with hypens in filenames ...

if [ $# -ne 1 ]; then
    echo "Usage: $0 [single-filename-with-underscors]"
    exit
fi

inputf=$1

source_path=$(realpath $(dirname ${inputf}))
dest_path="/usr/local/bin"
name=$(basename ${inputf})

renamed=$(echo ${name} | tr '_' '-')
# echo "renamed: ${renamed}"

fname_full=$(basename ${renamed})
fname=${fname_full%%.*}
ext=${fname_full##*.}


echo "Renaming ${name} to ${renamed}"
# echo "mv -vvv ${source_path}/${name} ${source_path}/${renamed}"
mv -vvv ${source_path}/${name} ${source_path}/${renamed}

echo "Soft-linking $(realpath ${source_path}/${fname_full}) to ${dest_path}/${fname}"
sudo ln -sv $(realpath ${source_path}/${fname_full}) ${dest_path}/${fname}
