#! /bin/sh

print_options() {
	echo "Shut down"
	echo "Reboot"
	echo "Lock screen"
	echo "Log out"
	echo "Suspend"
}

menu() {
	case "$1" in
		"Shut down")
			systemctl poweroff
			;;
		"Reboot")
			systemctl reboot
			;;
		"Lock screen")
			$HOME/.local/scripts/lockscreen.sh 2>/dev/null >/dev/null &
			;;
		"Log out")
			loginctl terminate-user $USER
			;;
		"Suspend")
			$HOME/.local/scripts/lockscreen.sh 2>/dev/null >/dev/null & systemctl suspend
			;;
	esac
	exit 0
}

echo -en "\0prompt\x1f⏻︁\n"
[ -n "$1" ] && menu "$1" && exit 0
print_options

