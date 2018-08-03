#swap
free -m
swapon -s
df -hal
dd if=/dev/zero of=/swapfile bs=1024 count=512k
mkswap /swapfile
swapon /swapfile
swapon -s
vim /etc/fstab
add '/swapfile          swap            swap    defaults        0 0'
chown root:root /swapfile
chmod 0600 /swapfile
