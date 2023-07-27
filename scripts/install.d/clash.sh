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

# 安装软件
function install(){
	echo "开始安装clash"
	local name="Clash.for.Windows-0.20.30-x64-linux"
	wget -P $DOWNLOADS_DIR https://github.com/Fndroid/clash_for_windows_pkg/releases/download/0.20.30/$name.tar.gz
	tar -zxvf $DOWNLOADS_DIR/$name.tar.gz -C $INSTALL_HOME
	mv $INSTALL_HOME/$name $INSTALL_HOME/Clash
	sudo ln -s $INSTALL_HOME/Clash/cfw /usr/local/bin/clash
}


install
