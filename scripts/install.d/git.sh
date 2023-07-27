#!/bin/bash

# dotfile文件目录
DOTFILE_HOME=$HOME/space/dotfiles/git/gitconfig


if [ ! -d "$DOTFILE_HOME" ]; then
	echo "dotfile不存在，需要先clone space仓库再下载子模块"
	exit
fi

# 安装软件
function install(){
	echo "开始安装git"
	sudo apt install git -y
}

function config(){
	echo "开始配置git"
	ln -s $DOTFILE_HOME $HOME/.gitconfig
}

install
config


