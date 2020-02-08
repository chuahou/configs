#!/bin/bash
#
# Installs Telegram.
#
# DO NOT RUN AS ROOT

# check for root
if [ "$EUID" -eq 0 ]
then
    echo "Do not run as ROOT."
    exit
fi

# download archive
wget https://telegram.org/dl/desktop/linux -O t.tar.xz
tar xJf t.tar.xz
mv Telegram ~
rm t.tar.xz

