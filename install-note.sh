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

#php 7.3
# require
yum -y install libxml2
yum -y install libxml2-devel
yum -y install openssl
yum -y install openssl-devel
yum -y install curl-devel
yum -y install libjpeg-devel
yum -y install libpng-devel
yum -y install freetype-devel
yum -y install bzip2-devel
yum -y install libmcrypt libmcrypt-devel
yum -y install postgresql-devel
yum -y install aspell-devel
yum -y install readline-devel
yum -y install libxslt-devel
yum -y install net-snmp-devel
yum -y install unixODBC-devel
yum -y install libicu-devel
yum -y install libc-client-devel
yum -y install libXpm-devel
yum -y install libvpx-devel
yum -y install enchant-devel
yum -y install openldap
yum -y install openldap-devel
yum -y install db4-devel
yum -y install gmp-devel
yum -y install sqlite-devel
yum -y install mysql-devel
yum install -y gcc

tar -zxvf php-7.3.tar.gz
cd php-7.3

./configure --prefix=/usr/local/php7.3.beta1 --with-config-file-path=/usr/local/php7.3.beta1/etc --enable-fpm --with-fpm-user=www --with-fpm-group=www --enable-inline-optimization --disable-debug --disable-rpath --enable-shared --enable-soap --with-xmlrpc --with-openssl --with-mcrypt --with-pcre-regex --with-sqlite3 --with-zlib --enable-bcmath --with-iconv --with-bz2 --enable-calendar --with-curl --with-cdb --enable-dom --enable-exif --enable-fileinfo --enable-filter --with-pcre-dir --enable-ftp --with-gd --with-openssl-dir --with-jpeg-dir --with-png-dir --with-freetype-dir --enable-gd-native-ttf --with-gettext --with-gmp --with-mhash --enable-json --enable-mbstring --enable-mbregex --enable-mbregex-backtrack --with-libmbfl --with-onig --enable-pdo --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-zlib-dir --with-pdo-sqlite --with-readline --enable-session --enable-shmop --enable-simplexml --enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-wddx --with-libxml-dir --with-xsl --enable-zip --enable-mysqlnd-compression-support --with-pear --enable-opcache

make
make install

cp php.ini-development /usr/local/php7.3.beta1/lib/php.ini
cp /usr/local/php7.3.beta1/etc/php-fpm.conf.default /usr/local/php7.3.beta1/etc/php-fpm.conf
cp /usr/local/php7.3.beta1/etc/php-fpm.d/www.conf.default /usr/local/php7.3.beta1/etc/php-fpm.d/www.conf
cp -R ./sapi/fpm/php-fpm /etc/init.d/php-fpm

#systemctl-----php-fpm
vim /usr/lib/systemd/system/php-fpm.service
#add 
[Unit]

Description=php

After=network.target

[Service]

Type=forking

ExecStart=/usr/local/php7.3.beta1/sbin/php-fpm

ExecStop=/bin/pkill -9 php-fpm

PrivateTmp=true

[Install]

WantedBy=multi-user.target
#end
 

systemctl restart php-fpm.service
systemctl enable php-fpm.service

#php PATH
vim /etc/profile
#add
#lx-new -php PATH
PATH=$PATH:/usr/local/php7.3.beta1/bin
export PATH
#end
source /etc/profile

#nginx-php-dfm
vim /etc/nginx/nginx.conf
#add
location ~ \.php$ {
      root /usr/share/nginx/html; #指定php的根目录
      fastcgi_pass 127.0.0.1:9000;#php-fpm的默认端口是9000
      fastcgi_index index.php;
      fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
      include fastcgi_params;
}
#end