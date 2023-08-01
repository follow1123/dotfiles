#!/bin/bash

# 配置文件的目录
CONFIG_HOME=$HOME/.config
# dotfile文件目录
# DOTFILE_HOME=$HOME/space/dotfiles/joshuto


if [ ! -d "$CONFIG_HOME" ]; then
	echo "用户配置目录\"$CONFIG_HOME\"不存在，已创建目录"
	mkdir -p $CONFIG_HOME
fi

# if [ ! -d "$DOTFILE_HOME" ]; then
# 	echo "dotfile不存在，需要先clone space仓库再下载子模块"
# 	exit
# fi
function libraries(){
	sudo apt install nlohmann-json3-dev libcli11-dev libvips-dev libsixel-dev chafa openssl libtbb-dev libspdlog-dev libfmt-dev libxcb-res0-dev -y
}

# 安装软件
function install(){
	echo "开始安装joshuto"
	cd $HOME/space/soft && \
	git clone https://github.com/jstkdng/ueberzugpp.git && \
	cd ueberzugpp && \
	mkdir build && cd build && \
	cmake -DCMAKE_BUILD_TYPE=Release -DENABLE_OPENCV=off ..&& \
	cmake --build . && \
	sudo ln -s $HOME/space/soft/ueberzugpp/build/ueberzug /usr/local/bin/ueberzug
	sudo ln -s $HOME/space/soft/ueberzugpp/build/ueberzugpp /usr/local/bin/ueberzugpp
}


libraries
install


