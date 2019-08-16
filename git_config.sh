#!/bin/bash
#
# Configures git settings

# check for root
if [ "$EUID" -eq 0 ]
then
    echo "Do not run as ROOT."
    exit
fi

git config --global user.email "human@chuahou.dev"
git config --global user.name "Chua Hou"
git config --global credential.helper cache 900
git config --global core.editor "vim"
