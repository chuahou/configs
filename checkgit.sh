#!/bin/bash
#
# Checks all folders in the same level and prints git status.

for dir in `find ${PWD}/.. -mindepth 1 -maxdepth 1 -type d`; do
    cd "$dir"
    printstatus=0
    gitstatus=$(git status)

    # if fatal, skip
    if [ $? -ne 0 ]; then
        continue
    fi

    # check for unstaged
    echo $gitstatus | grep "nothing to commit" > /dev/null
    if [ $? -ne 0 ]; then
        printstatus=$((printstatus + 1))
    fi

    # check for staged
    echo $gitstatus | grep "to be committed" > /dev/null
    if [ $? -eq 0 ]; then
        printstatus=$((printstatus + 1))
    fi

    # check for committed but ahead
    echo $gitstatus | grep "ahead of" > /dev/null
    if [ $? -eq 0 ]; then
        printstatus=$((printstatus + 1))
    fi

    # if should print, print status
    if [ "$printstatus" -gt "0" ]; then
        pwd
        git status
        echo
    fi
done
