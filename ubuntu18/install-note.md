wqeeqweggerer ererwer
yutyfyfutfyfufyufyufreqrwqdadwq
# Ubuntu18  Note

##### 卸载旧版本
`sudo apt-get remove docker docker-engine docker.io containerd runc`
## Docker
### 使用 Docker 仓库进行安装
更新 apt 包索引。
`sudo apt-get update`
安装 apt 依赖包，用于通过HTTPS来获取仓库
```bash
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
```
添加 docker 官方密钥
`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`
9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88 通过搜索指纹的后8个字符，验证您现在是否拥有带有指纹的密钥。
`sudo apt-key fingerprint 0EBFCD88`
```bash
pub   rsa4096 2017-02-22 [SCEA]
      9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
uid           [ unknown] Docker Release (CE deb) <docker@docker.com>
sub   rsa4096 2017-02-22 [S]
```
使用以下指令设置稳定版仓库
```bash
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"
```
#### 安装 Docker Engine-Community
更新 apt 包索引
`sudo apt-get update`
安装最新版本的 Docker Engine-Community 和 containerd ，或者转到下一步安装特定版本
`sudo apt-get install docker-ce docker-ce-cli containerd.io`
要安装特定版本的 Docker Engine-Community，请在仓库中列出可用版本，然后选择一种安装。列出您的仓库中可用的版本
`apt-cache madison docker-ce`
```bash
docker-ce | 5:18.09.1~3-0~ubuntu-xenial | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
  docker-ce | 5:18.09.0~3-0~ubuntu-xenial | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
  docker-ce | 18.06.1~ce~3-0~ubuntu       | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
  docker-ce | 18.06.0~ce~3-0~ubuntu       | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
  ...
```
使用第二列中的版本字符串安装特定版本，例如 5:18.09.1~3-0~ubuntu-xenial
`sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io`
测试 Docker 是否安装成功，输入以下指令，打印出以下信息则安装成功
`sudo docker run hello-world`
```bash
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
1b930d010525: Pull complete                                                                                                                                  Digest: sha256:c3b4ada4687bbaa170745b3e4dd8ac3f194ca95b2d0518b417fb47e5879d9b5f
Status: Downloaded newer image for hello-world:latest


Hello from Docker!
This message shows that your installation appears to be working correctly.


To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.


To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash


Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/


For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```
### 使用 Shell 脚本进行安装
Docker 在 [get.docker.com](get.docker.com) 和 [test.docker.com](test.docker.com) 上提供了方便脚本，用于将快速安装 Docker Engine-Community 的边缘版本和测试版本。脚本的源代码在 docker-install 仓库中。 不建议在生产环境中使用这些脚本，在使用它们之前，您应该了解潜在的风险
- 脚本需要运行 root 或具有 sudo 特权。因此，在运行脚本之前，应仔细检查和审核脚本。
- 这些脚本尝试检测 Linux 发行版和版本，并为您配置软件包管理系统。此外，脚本不允许您自定义任何安装参数。从 Docker 的角度或您自己组织的准则和标准的角度来看，这可能导致不支持的配置。
- 这些脚本将安装软件包管理器的所有依赖项和建议，而无需进行确认。这可能会安装大量软件包，具体取决于主机的当前配置。
- 该脚本未提供用于指定要安装哪个版本的 Docker 的选项，而是安装了在 edge 通道中发布的最新版本。
- 如果已使用其他机制将 Docker 安装在主机上，请不要使用便捷脚本。

本示例使用 [get.docker.com](get.docker.com) 上的脚本在 Linux 上安装最新版本的Docker Engine-Community。要安装最新的测试版本，请改用 [test.docker.com](test.docker.com)。在下面的每个命令，取代每次出现 get 用 test。
`curl -fsSL https://get.docker.com -o get-docker.sh`
`sudo sh get-docker.sh`
### 选用国内的云服务商
以阿里云为例
`curl -sSL http://acs-public-mirror.oss-cn-hangzhou.aliyuncs.com/docker-engine/internet | sh -`
安装所需软件包
`sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual`
添加使用 HTTPS 传输的软件包以及 CA 证书
```bash
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates
```
添加GPG密钥
`sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D`
添加软件源
`echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list`
添加成功后更新软件包缓存
`sudo apt-get update`
安装
`sudo apt-get install docker-engine`
启动 docker
`sudo systemctl enable docker`
`sudo systemctl start docker`
[文档明细](https://www.runoob.com/docker/ubuntu-docker-install.html)

## MySQL
安装
`sudo apt-get update`
`sudo apt-get install mysql-server`
初始化配置
`sudo mysql_secure_installation`
检查服务
`systemctl status mysql.service`
连接
`sudo mysql -uroot -p`
```sql
# 创建数据库weixx
CREATE DATABASE weixx;
# 创建用户wxx(密码654321) 并允许wxx用户可以从任意机器上登入mysql的weixx数据库
GRANT ALL PRIVILEGES ON weixx.* TO wxx@"%" IDENTIFIED BY "654321";
```
修改 my.cnf


## PHP
下载链接，[PHP7](https://www.php.net/distributions/php-7.3.11.tar.gz)
解压
`tar -xvJf ./php-7.3.1.tar.xz`
`cd php-7.3`
安装一些编译PHP所需要的依赖
`sudo apt update`
```bash
sudo apt install gcc
sudo apt install make
sudo apt install openssl
sudo apt install curl
sudo apt install libbz2-dev
sudo apt install libxml2-dev
sudo apt install libjpeg-dev
sudo apt install libpng-dev
sudo apt install libfreetype6-dev
sudo apt install libzip-dev
...
```
生成 makefile
```bash
./configure --prefix=/usr/local/php7 --with-config-file-path=/usr/local/php/etc --enable-fpm --with-fpm-user=lx --with-fpm-group=lx --with-mysqli --with-pdo-mysql --with-iconv-dir --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr --enable-xml --disable-rpath --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --with-curl --enable-mbregex --enable-mbstring --enable-ftp --with-gd --with-openssl --with-mhash --enable-pcntl --enable-sockets --with-xmlrpc --enable-zip --enable-soap --without-pear --with-gettext --disable-fileinfo --enable-maintainer-zts
```
```bash
+--------------------------------------------------------------------+
| License:                                                          |
| This software is subject to the PHP License, available in this    |
| distribution in the file LICENSE.  By continuing this installation |
| process, you are bound by the terms of this license agreement.    |
| If you do not agree with the terms of this license, you must abort |
| the installation process at this point.                            |
+--------------------------------------------------------------------+

Thank you for using PHP.
```
在完成配置后，可以直接使用make来进行编译，可以使用参数-j来指定编译线程数量来多线程编译
`make -j4`
完成提示
```bash
Build complete.
Don't forget to run 'make test'.
```
make install
`sudo make install`
验证安装成功
`/usr/local/php/bin/php -v`
复制php.ini
`sudo cp php.ini-development /usr/local/php/etc/php.ini`












