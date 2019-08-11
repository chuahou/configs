#!/bin/bash
#
# Checks all folders in the same level and prints git status.

find .. -mindepth 1 -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'echo "{}" && cd "{}" && git status && echo && echo' \;
