#!/bin/bash

# 安装依赖
function libraries(){
	sudo apt install curl -y
}

# 安装软件
function install(){
	echo "开始安装rust环境"
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}


libraries
install
