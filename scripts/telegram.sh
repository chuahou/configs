#!/bin/bash
#
# Installs Telegram.
#
# Do NOT run as ROOT.

# check not root
$(dirname "$0")/check_root.sh user || exit 1

# check if already exists
test -d ~/Telegram && exit

# download archive
wget https://telegram.org/dl/desktop/linux -O t.tar.xz
tar xJf t.tar.xz
mv Telegram ~
rm t.tar.xz
