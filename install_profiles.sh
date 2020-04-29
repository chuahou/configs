#!/bin/bash
#
# Copies profile, bash_aliases etc to ~
#
# DO NOT RUN AS ROOT

# check for root
if [ "$EUID" -eq 0 ]
then
    echo "Do not run as ROOT."
    exit
fi

# copy home dotfiles
cp profiles/bash_aliases ~/.bash_aliases
cp profiles/profile ~/.profile
cp profiles/vimrc ~/.vimrc
cp profiles/bashrc ~/.bashrc
cp profiles/ghci ~/.ghci
cp profiles/Xresources-regolith ~/.Xresources-regolith

# make directories for non-~ configs
mkdir -p ~/.config/gtk-3.0 ~/.config/dunst ~/.config/regolith

# copy non-~ configs
cp profiles/gtk.css ~/.config/gtk-3.0/gtk.css
cp profiles/dunstrc ~/.config/dunst/dunstrc
cp profiles/regolith/* -r ~/.config/regolith

# make directories for vim
mkdir -p ~/.vim
mkdir -p ~/.vim/backup
