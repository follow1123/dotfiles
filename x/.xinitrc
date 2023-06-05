#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
# . /etc/X11/Xsession
# 输入法
export SHELL="/bin/zsh"
export XMODIFIERS="@im=fcitx"
sh $HOME/scripts/dwm/start_dwm.sh
