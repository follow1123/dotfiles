#!/bin/bash

# 配置文件的目录
CONFIG_HOME=$HOME/.config
# dotfile文件目录
DOTFILE_HOME=$HOME/space/dotfiles/nvim
# 软件安装目录
INSALL_HOME=$HOME/space/soft


if [ ! -d "$CONFIG_HOME" ]; then
	echo "用户配置目录\"$CONFIG_HOME\"不存在，已创建目录"
	mkdir -p $CONFIG_HOME
fi

if [ ! -d "$DOTFILE_HOME" ]; then
	echo "dotfile不存在，需要先clone space仓库再下载子模块"
	exit
fi

if [ ! -d "$INSALL_HOME" ]; then
	echo "软件安装目录\"$INSALL_HOME\"不存在，已创建目录"
	mkdir -p $INSALL_HOME
fi

# 安装依赖
function libraries(){
	ehco "开始安装neovim依赖包"
	sudo apt install cmake xclip gettext -y
}

# 安装软件
function install(){
	echo "开始从github安装neovim"
	git clone https://github.com/neovim/neovim
	cd $INSALL_HOME/neovim
	git checkout stable
	make CMAKE_BUILD_TYPE=RelWithDebInfo
	sudo make install
}

function config(){
	echo "开始配置neovim"
	ln -s $DOTFILE_HOME $CONFIG_HOME
}

libraries
cd $INSALL_HOME && install
config

echo "安装完成，如果需要配置root用户，使用sudo执行这个脚本_root的脚本"

