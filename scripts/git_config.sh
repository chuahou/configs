#!/bin/bash
#
# Configures git settings
#
# Do NOT run as ROOT.

# check not root
./check_root.sh user || exit 1

git config --global user.email "human+github@chuahou.dev"
git config --global user.name "Chua Hou"
git config --global credential.helper cache 900
git config --global core.editor "vim"
