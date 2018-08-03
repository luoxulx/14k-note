#git-user
useradd lx
passwd lx

#swap
free -m
swapon -s
df -hal
dd if=/dev/zero of=/swapfile bs=1024 count=1024k
mkswap /swapfile
swapon /swapfile
swapon -s
vim /etc/fstab
add '/swapfile          swap            swap    defaults        0 0'
chown root:root /swapfile
chmod 0600 /swapfile

#.vimrc --config
set nu
set shortmess=atI
syntax on
set nobackup
set confirm
set mouse=a
set tabstop=4
set shiftwidth=4
set autoread
set hlsearch
set showmatch
set ruler
autocmd InsertEnter * se cul
#"set background=dark

# firewalld
systemctl status firewalld.service
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --list-ports
systemctl restart firewalld.service

#MariaDB 10.1.33=>mysql5.5
vim /etc/yum.repos.d/MariaDB.repo
'
# MariaDB 10.1.33 CentOS repository list - created 2018-05-27 07:02 UTC
# http://downloads.mariadb.org/mariadb/repositories/
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.1.33/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
'
yum install MariaDB-server MariaDB-client
y
y
systemctl enable mariadb
systemctl start mariadb
systemctl status mariadb
mysql -V
mysql_secure_installation
y
mysql -u root -p

#nginx
yum install epel-release
yum install nginx
systemctl enable nginx
systemctl start nginx
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --reload
systemctl status nginx
nginx -v
