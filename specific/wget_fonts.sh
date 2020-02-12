#!/bin/bash
#
# Downloads the inconsolata font from the Google Fonts repo on GitHub.
#
# Do NOT run as root.

# check for root
if [ "$EUID" -eq 0 ]
then
    echo "Do not run as ROOT."
    exit
fi

# get files
wget https://github.com/google/fonts/raw/master/ofl/inconsolata/Inconsolata-Bold.ttf
wget https://github.com/google/fonts/raw/master/ofl/inconsolata/Inconsolata-Regular.ttf
wget https://github.com/google/fonts/raw/master/ofl/prata/Prata-Regular.ttf
wget https://github.com/i-tu/Hasklig/releases/download/1.1/Hasklig-1.1.zip

# unzip Hasklig
unzip Hasklig-1.1.zip

# install in ~/.fonts
mkdir -p ~/.fonts
mv *.ttf ~/.fonts
mv *.otf ~/.fonts

