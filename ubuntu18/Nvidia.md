gqegriqwgurigqwur
rewrewrwerwerwerwer
rqrqrqwrqwrqwrqwrqw
## Ubuntu 切换独显|集显

检查现有显卡
`lspci -k | grep -A 2 -i "VGA"`
打开系统设置-详细：查看正在使用的显卡
### 安装Nvidia显卡驱动
先添加NVIDIA 的ppa 源
`sudo add-apt-repository ppa:graphics-drivers/ppa`
`sudo apt-get update`
打开system settings -> Softwares & Updates -> Additional Drivers，或者在中终端输入
`software-properties-gtk`

打开终端，查看为你的显卡推荐使用的驱动
`sudo ubuntu-drivers devices`
使用nvidia-387
`sudo apt-get install nvidia-387`
安装完成之后，打开Software & Updates，可以看到新安装的显卡驱动已经在使用
终端输入
`nvidia-settings`
打开Nvidia X Server Settings，选择PRIME Profile，在此可以自由切换集显和独显。如果没有PRIME Profiles，先reboot。
[资料](https://www.jianshu.com/p/85cbb0258d32)


查询命令

`lspci | grep -i vga`

`lspci | grep -i 3d`
