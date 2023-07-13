#!/bin/bash

dotfile_dir=$(cd $(dirname $0); pwd)

if [ ! -d "~/.config" ]; then
	mkdir ~/.config
fi

# nvim
ln -s $dotfile_dir/nvim ~/.config

# zsh
ln -s $dotfile_dir/zsh/zshrc ~/.zshrc
ln -s $dotfile_dir/zsh/zsh ~/.zsh


# alacritty
ln -s $dotfile_dir/alacritty ~/.config

# lf
ln -s $dotfile_dir/lf ~/.config

# lazygit
ln -s $dotfile_dir/lazygit ~/.config
