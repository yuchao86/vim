#!/bin/bash
echo "安装将花费一定时间，请耐心等待直到安装完成^_^"
if which apt-get >/dev/null; then
	sudo apt-get install -y vim vim-gnome ctags xclip astyle python-setuptools python-dev git
elif which yum >/dev/null; then
	sudo yum install -y gcc vim git ctags xclip astyle python-setuptools python-devel	
fi

##Add HomeBrew support on  Mac OS
if which brew >/dev/null;then
    echo "You are using HomeBrew tool"
    brew install vim ctags git astyle
fi

sudo easy_install -ZU autopep8 
sudo ln -s /usr/bin/ctags /usr/local/bin/ctags
mv -f ~/vim ~/vim_old
cd ~/ && git clone https://github.com/yuchao86/vim.git
mv -f ~/.vim ~/.vim_old
mv -f ~/vim ~/.vim
mv -f ~/.vimrc ~/.vimrc_old
cp -f ~/.vim/_vimrc ~/.vimrc
#git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "yuchao86正在努力为您安装bundle程序" > yuchao86
echo "安装完毕将自动退出" >> yuchao86
echo "请耐心等待" >> yuchao86
vim yuchao86 -c "BundleInstall" -c "q" -c "q"
rm yuchao86
echo "安装完成"
