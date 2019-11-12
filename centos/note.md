# Note
#### 限制 PHP 的目录
项目目录新建 .user.ini
添加内容
```ini
open_basedir=/var/wwwroot/cloud_lnmpa_top/:/tmp/:/proc/
```
#### 修改密码
`passwd root`
#### 添加用户
`useradd lx`
`passwd lx`
#### 下载 composer.phar
`wget https://getcomposer.org/download/1.8.0/composer.phar`
#### 基本命令
```bash
yum update -y
yum autoremove
yum install net-tools
```
#### 网络流量工具
```bash
yum install iftop

iftop -i eth0
```

#### 创建swap
```bash
free -m
swapon -s
df -hal
dd if=/dev/zero of=/swapfile bs=1024 count=1024k
mkswap /swapfile
swapon /swapfile
swapon -s
vim /etc/fstab
# 添加内容：/swapfile          swap            swap    defaults        0 0
chown root:root /swapfile
chmod 0600 /swapfile
```

#### 编辑器 Vim
##### 安装
`yum install vim`
##### 配置
`vi .vimrc`
```vim
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
```
#### 防火墙配置
```bash
systemctl stop firewalld.service
firewall-cmd --permanent --zone=public --add-port=80/tcp
firewall-cmd --permanent --zone=public --add-port=80/udp
firewall-cmd --permanent --zone=public --remove-port=3306/tcp
firewall-cmd --zone=public --list-ports
systemctl reload firewalld.service
```
#### 挂载磁盘
```bash
fdisk -l
df -T /
mount -t ext4 /dev/vdb1 /data
vim /etc/fstab
# 添加内容：/dev/vdb /20G-disk ext4 defaults 0 0
```
## 服务监控(弃用)
`git clone https://github.com/firehol/netdata.git`

##  普通安装nginx
#### 安装
```bash
yum install epel-release
yum install nginx
systemctl enable nginx
systemctl start nginx
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --reload
systemctl status nginx
nginx -v
```
#### nginx auth 配置
`yum  -y install httpd-tools`
`htpasswd -c /usr/local/src/nginx/passwd username`
在 conf.d 下的 xxx.conf 中新增内容：
```nginx
auth_basic "Please input password"; # 这里是验证时的提示信息
auth_basic_user_file /usr/local/src/nginx/passwd;
```
### Redis
```bash
yum install redis
systemctl enable redis
```
## MariaDB 10.1.33 => MySQL5.5
`vim /etc/yum.repos.d/MariaDB.repo`
添加内容：
```ini
# MariaDB 10.1.33 CentOS repository list - created 2018-05-27 07:02 UTC
# http://downloads.mariadb.org/mariadb/repositories/
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.4/centos7-amd64/
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
```
安装
`yum install MariaDB-server MariaDB-client`  y  y
```bash
systemctl enable mariadb
systemctl start mariadb
systemctl status mariadb
mysql -V
mysql_secure_installation
y
mysql -u root -p
```
## PHP7.3
依赖
```bash
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
yum -y install libzip-devel
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
```
解压
`tar -zxvf php-7.3.tar.gz`
`cd php7.3`
编译安装
```bash
./configure --prefix=/usr/local/php7.3 --with-config-file-path=/usr/local/php7.3/etc --enable-fpm --with-fpm-user=lx --with-fpm-group=lx --enable-inline-optimization --disable-debug --disable-rpath --enable-shared --enable-soap --with-xmlrpc --with-openssl --with-mcrypt --with-pcre-regex --with-sqlite3 --with-zlib --enable-bcmath --with-iconv --with-bz2 --enable-calendar --with-curl --with-cdb --enable-dom --enable-exif --enable-fileinfo --enable-filter --with-pcre-dir --enable-ftp --with-gd --with-openssl-dir --with-jpeg-dir --with-png-dir --with-freetype-dir --enable-gd-native-ttf --with-gettext --with-gmp --with-mhash --enable-json --enable-mbstring --enable-mbregex --enable-mbregex-backtrack --with-libmbfl --with-onig --enable-pdo --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-zlib-dir --with-pdo-sqlite --with-readline --enable-session --enable-shmop --enable-simplexml --enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-wddx --with-libxml-dir --with-xsl --enable-zip --enable-mysqlnd-compression-support --with-pear --enable-opcache --enable-swoole --enable-swoole-static

make
make install
# 配置
cp php.ini-development /usr/local/php7.3/etc/php.ini
cp /usr/local/php7.3/etc/php-fpm.conf.default /etc/php7.3/php-fpm.conf
cp /usr/local/php7.3/etc/php-fpm.d/www.conf.default /etc/php7.3/php-fpm.d/www.conf
cp -R ./sapi/fpm/php-fpm /etc/init.d/php-fpm
```
配置 systemctl.service
`vim /usr/lib/systemd/system/php-fpm.service`
添加内容
```ini
[Unit]

Description=php

After=network.target

[Service]

Type=forking

ExecStart=/usr/local/php7.2.13/sbin/php-fpm

ExecStop=/bin/pkill -9 php-fpm

PrivateTmp=true

[Install]

WantedBy=multi-user.target
```
测试
```bash
systemctl enable php-fpm.service
systemctl restart php-fpm.service
```
添加到环境变量
`vim /etc/profile`
`PATH=$PATH:/usr/local/php7.2.13/bin`
`export PATH`
`source /etc/profile`
测试
```bash
php --ini
php -m
```

#### 扩展
```bash
yum install gcc-c++
yum install glibc-headers
```
##### 初阶安装
`wget https://github.com/swoole/swoole-src/archive/v4.2.12.tar.gz`
```bash
cd swoole
sudo phpize (ubuntu 没有安装phpize可执行命令：sudo apt-get install php-dev来安装phpize)
sudo ./configure
sudo make
sudo make install
```
添加 extension=swoole.so
##### 进阶安装
```bash
mkdir -p ~/build && \
cd ~/build && \
rm -rf ./swoole-src && \
curl -o ./tmp/swoole.tar.gz https://github.com/swoole/swoole-src/archive/master.tar.gz -L && \
tar zxvf ./tmp/swoole.tar.gz && \
mv swoole-src* swoole-src && \
cd swoole-src && \
phpize && \
./configure \
--enable-coroutine \
--enable-openssl  \
--enable-http2  \
--enable-async-redis \
--enable-sockets \
--enable-mysqlnd && \
make clean && make && sudo make install
```
添加extension=swoole.so
