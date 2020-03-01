#!/bin/bash
#
# Uses `apt` to install the common packages I will need on every new Ubuntu
# installation. I started working on this late, so it will be incomplete.
#
# Run as root.

# check for root
if [ "$EUID" -ne 0 ]
then
    echo "Run as ROOT."
    exit
fi

# update package lists
apt update

# install build tools
apt install build-essential pkg-config cmake -y

# install tools
apt install vim git tmux gitg git-lfs doxygen doxygen-gui graphviz curl checkinstall -y

# install user applications
apt install libreoffice vlc gimp -y
snap install pdftk -y

# install ibus
apt install ibus ibus-mozc -y

# install MS fonts and FiraCode
apt install ttf-mscorefonts-installer fonts-firacode -y

# install piper
# add-apt-repository ppa:libratbag-piper/piper-libratbag-git
# apt update
# apt install piper

# install LaTeX
apt install texlive texlive-latex-extra latex-cjk-all texlive-xelatex texlive-science -y

# install powersaving
apt install powertop cpufrequtils laptop-mode-tools -y

# install GNOME things
apt install gnome-tweak-tool gnome-shell-extension-dashtodock gnome-shell-extensions y

# TODO: Will add more things when I realise I need them

