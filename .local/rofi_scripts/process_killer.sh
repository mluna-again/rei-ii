#! /bin/bash

[ -n "$1" ] && killall "$1" && exit 0

echo -en "\0prompt\x1f💣︁\n"
ps -u $USER | tail -n +2 | awk '{ print $4 }' | sort -u | grep -v process_killer
