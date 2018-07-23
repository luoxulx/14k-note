#!/usr/bin/env bash
#google bbr and update to atleast 4.9
wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh
chmod +x bbr.sh
./bbr.sh
reboot
