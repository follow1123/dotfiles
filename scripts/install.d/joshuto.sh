#!/bin/bash

# 配置文件的目录
CONFIG_HOME=$HOME/.config
# dotfile文件目录
DOTFILE_HOME=$HOME/space/dotfiles/joshuto


if [ ! -d "$CONFIG_HOME" ]; then
	echo "用户配置目录\"$CONFIG_HOME\"不存在，已创建目录"
	mkdir -p $CONFIG_HOME
fi

# if [ ! -d "$DOTFILE_HOME" ]; then
# 	echo "dotfile不存在，需要先clone space仓库再下载子模块"
# 	exit
# fi
function libraries(){
	# 图片信息预览工具
	sudo apt install libimage-exiftool-perl

	echo "需要安装当前ueberzug实现预览图片功能，安装脚本在当前脚本目录下"
}

# 安装软件
function install(){
	echo "开始安装joshuto"
	cd $HOME/space/soft && \
	git clone https://github.com/kamiyaa/joshuto.git && \
	cd joshuto && \
	cargo install --path=. --force
}

function config(){
	echo "开始配置joshuto"
	# ln -s $DOTFILE_HOME $CONFIG_HOME
}

install
config


