#!/usr/bin/env bash
#
# Checks all folders in the same level as the script's directory and prints
# outstanding git statuses.

DIR=$(dirname $0)      # get directory script is in
DIR=$(realpath "$DIR") # expand to full path
DIR=$(dirname "$DIR")  # get parent directory of that directory

# find all subdirectories of DIR
for dir in $(find $DIR -mindepth 1 -maxdepth 1 -type d); do
	# go into relevant subdirectory
	cd "$dir"
	printstatus=0                        # whether to print the status or not
	gitstatus=$(git status 2> /dev/null) # get status and ignore errors

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
		tput setaf 5 && tput bold && pwd && tput sgr0
		git status
		echo

		# set that we have printed something
		printed="yes"
	fi
done

# if nothing outstanding has been printed, print happy message
if [ -z $printed ]; then
	echo "All repos committed and pushed"
fi
