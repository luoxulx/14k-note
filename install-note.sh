#!/usr/bin/env bash
#add DATA disk
fdisk -l
fdisk /dev/vdb1
n，p，1，'enter'，'enter'，w
fdisk -l
makdir /xxx
mkfs -t ext3 /dev/vdb1 
mount /dev/vdb1 /xxx/
df -h
blkid
vi /etc/fstab
'/dev/vdbl /aiWn eac4 defaulcg 0 0'

#google bbr and update to atleast 4.9
wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh
chmod +x bbr.sh
./bbr.sh
reboot
