#!/bin/bash
#
# Clones chuahou/dynamic-wallpaper
#
# Do NOT run as ROOT.

# check not root
./check_root.sh user || exit 1

TARGET=~/Projects/dynwall
mkdir -p $(dirname $TARGET)
git clone --depth 1 https://chuahou@github.com/chuahou/dynwall.git $TARGET
