#!/bin/bash

# 文件下载目录
DOWNLOADS_DIR=$HOME/Downloads

# 安装目录
INSTALL_HOME=$HOME/space/soft

if [ ! -d "$DOWNLOADS_DIR" ]; then
	echo "用户下载目录\"$DOWNLOADS_DIR\"不存在，已创建目录"
	mkdir -p $DOWNLOADS_DIR
fi

if [ ! -d "$INSTALL_HOME" ]; then
	echo "安装目录\"$INSTALL_HOME\"不存在，已创建目录"
	mkdir -p $INSTALL_HOME
fi

function libraries(){
	echo "开始安装firefox依赖"
	sudo apt install libdbus-glib-1-2
}

# 安装软件
function install(){
	echo "开始安装firefox"
	wget -P $DOWNLOADS_DIR https://download-installer.cdn.mozilla.net/pub/firefox/releases/115.0.2/linux-x86_64/zh-CN/firefox-115.0.2.tar.bz2
	tar xjf firefox-*.tar.bz2 -C $INSTALL_HOME
	sudo ln -s $INSTALL_HOME/firefox /usr/local/bin/firefox
}


libraries
install
