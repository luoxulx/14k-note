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
"set background=dark
set showmatch
set ruler
autocmd InsertEnter * se cul
