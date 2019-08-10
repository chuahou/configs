#!/bin/bash
#
# VS extension management script.

# prints usage
function print_usage
{
    echo "USAGE:"
    echo "    ./vsextensions.sh [OPERATION] [EXTENSIONS FILE]"
    echo
    echo "Where [OPERATION] is one of:"
    echo "    - exportnew   Export current extensions and overwrite extensions list"
    echo "    - export      Export current extensions and append new ones to extensions list"
    echo "    - install     Install extensions from current extensions list"
    echo
    echo "and [EXTENSIONS FILE] is the filename of the extensions list."
    echo
    echo "Example:"
    echo "    ./vsextensions.sh export extensions.txt"
    echo "    ./vsextensions.sh install extensions.txt"
}

# read command line args

# print usage if less than or more than 2 args
if [ "$#" -ne "2" ]
then
    print_usage
fi

# exportnew
if [ "$1" = "exportnew" ]; then
    code --list-extensions > temp
    sort temp > $2

# export
elif [ "$1" = "export" ]; then
    code --list-extensions > temp
    sort $2 > current
    comm -23 temp current >> current
    sort current > $2

# install
elif [ "$1" = "install" ]; then
    cat $2 | xargs -L 1 code --install-extension
fi

# clean temp files
rm -f temp current || true
