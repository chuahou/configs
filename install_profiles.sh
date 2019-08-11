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