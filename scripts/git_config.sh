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
if $(command -v nvim > /dev/null); then
	git config --global core.editor nvim # use nvim if present
else
	git config --global core.editor vim # use nvim if present
fi
git config --global commit.template ~/git_message.txt
