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

cp profiles/bash_aliases ~/.bash_aliases
cp profiles/profile ~/.profile
cp profiles/vimrc ~/.vimrc
cp profiles/bashrc ~/.bashrc
cp profiles/ghci ~/.ghci
cp profiles/gtk.css ~/.config/gtk-3.0/gtk.css
cp profiles/dunstrc ~/.config/dunst/dunstrc

mkdir -p ~/.vim
mkdir -p ~/.vim/backup
