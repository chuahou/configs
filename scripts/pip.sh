#!/usr/bin/env bash
#
# Installs global PIP packages.
#
# Run as ROOT.

# check for root
$(dirname "$0")/check_root.sh root || exit 1

# install InstantRST
# https://github.com/gu-fan/InstantRst
pip3 install https://github.com/Rykka/instant-rst.py/archive/master.zip

# install vim-rst-tables
# https://github.com/ossobv/vim-rst-tables-py3
pip3 install vim_bridge3

# install Sphinx and read the docs theme
# install breathe for doxygen interface
pip3 install sphinx_rtd_theme breathe
