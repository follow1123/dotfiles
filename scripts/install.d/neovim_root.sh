#!/bin/bash

# root用户配置文件目录
ROOT_CONFIG_HOME=/root/.config

# dotfile文件目录
DOTFILE_HOME=$HOME/space/dotfiles/nvim

if [ ! -d "$ROOT_CONFIG_HOME" ]; then
	echo "root用户配置目录\"$ROOT_CONFIG_HOME\"不存在，已创建目录"
	mkdir -p $ROOT_CONFIG_HOME
fi

if [ ! -d "$DOTFILE_HOME" ]; then
	echo "dotfile不存在，需要先clone space仓库再下载子模块"
	exit
fi

function config(){
	ln -s $DOTFILE_HOME $ROOT_CONFIG_HOME
}

config
