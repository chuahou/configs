#!/bin/bash
#
# Clones chuahou/dynamic-wallpaper
#
# Do NOT run as ROOT.

# check not root
./check_root.sh user || exit 1

mkdir -p ~/Projects
git clone https://chuahou@github.com/chuahou/dynamic-wallpaper.git ~/Projects/dynamic-wallpaper
