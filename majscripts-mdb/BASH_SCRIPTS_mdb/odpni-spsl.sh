#! /usr/bin/env bash
# pripni_spsl.sh

echo "UN-mounting /mnt/spsl ..."
sudo umount -v /mnt/spsl
sudo chattr +i /home/rgregor/majfajls/fourMeO.img
sudo rmdir -v /mnt/spsl