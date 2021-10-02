#! /bin/sh

show_info() {
	echo -en "\0prompt\x1f\n"
	nmcli connection show | tail -n +2 | awk '{ print $1 }' | grep -v docker
}

network=$(awk '{ print $1 }' <<< "$1")
[ -n "$1" ] && nmcli connection up "$network" 2>&1 >/dev/null || show_info

