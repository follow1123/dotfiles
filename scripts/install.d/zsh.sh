#!/bin/bash

# dotfile文件目录
DOTFILE_HOME=$HOME/space/dotfiles/zsh


if [ ! -d "$DOTFILE_HOME" ]; then
	echo "dotfile不存在，需要先clone space仓库再下载子模块"
	exit
fi


# 安装软件
function install(){
	echo "开始安装zsh"
	sudo apt install zsh -y
}

function config(){
	echo "开始配置zsh"
	ln -s $DOTFILE_HOME/zshrc $HOME/.zshrc
	ln -s $DOTFILE_HOME/zsh $HOME/.zsh
	ln -s $DOTFILE_HOME/env $HOME/.env
	sudo chsh -s /bin/zsh
	echo "zsh 已配置，需要重启系统"
}

install
config

echo "安装完成，如果需要配置root用户，使用sudo执行这个脚本_root的脚本"

