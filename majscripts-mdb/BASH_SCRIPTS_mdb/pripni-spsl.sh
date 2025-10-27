#! /usr/bin/env bash
# pripni_spsl.sh

echo "Mounting $HOME/majfajls/fourMeO.img --to-- /mnt/spsl ..."
sudo mkdir -v /mnt/spsl
sudo chattr -i /home/rgregor/majfajls/fourMeO.img
sudo mount -v /home/rgregor/majfajls/fourMeO.img /mnt/spsl

