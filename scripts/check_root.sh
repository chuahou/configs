#!/bin/bash
#
# Checks for presence / absence of root privileges.
#
# USAGE:
#	./check_sudo.sh root - check we are root
#	./check_sudo.sh user - check not root

# ensure 1 argument, otherwise print usage
if [ "$#" -ne 1 ]; then
	echo "USAGE:"
	echo "    ./check_sudo.sh root - check we are root"
	echo "    ./check_sudo.sh user - check not root"
	exit 1
fi

# check for root if $1 = root
if [ "$1" = "root" ]; then
	if [ "$EUID" -ne 0 ]; then
		echo "Run as ROOT."
		exit 1 # fail test
	fi
fi

# check not root if $1 = user
if [ "$1" = "user" ]; then
	if [ "$EUID" -eq 0 ]; then
		echo "Do NOT run as ROOT."
		exit 1 # fail test
	fi
fi
