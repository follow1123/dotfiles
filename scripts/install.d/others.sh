#!/bin/bash


# 安装软件
function install(){
	echo "开始安装其他软件"
	cargo install bat lsd fd-find ripgrep zoxide
}

install


