#!/bin/bash

# 文件下载目录
DOWNLOADS_DIR=$HOME/Downloads

# 安装目录
INSTALL_HOME=$HOME/space/env

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
	echo "开始安装go环境"
	local name="go1.20.6.linux-amd64"
	wget -P $DOWNLOADS_DIR https://dl.google.com/go/$name.tar.gz && \
	tar -zxvf "$DOWNLOADS_DIR/$name.tar.gz" -C $INSTALL_HOME && \
}


install
