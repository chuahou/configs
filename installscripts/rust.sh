#!/bin/bash
#
# Installs rust.
#
# Do NOT run as ROOT.

# check not root
../scripts/check_root.sh user || exit 1

# install rust
curl https://sh.rustup.rs -sSf | sh
