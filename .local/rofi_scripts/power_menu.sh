#! /bin/sh

print_options() {
	echo "Shut down"
	echo "Reboot"
	echo "Lock screen"
	echo "Log out"
	echo "Suspend"
	exit 0
}

echo -en "\0prompt\x1f⏻︁\n"
[ -z "$1" ] && print_options

case "$1" in
	"Shut down")
		echo "Shutting down..."
		systemctl poweroff
		;;
	"Reboot")
		echo "Rebooting..."
		systemctl reboot
		;;
	"Lock screen")
		echo "Locking screen..."
		~/.local/scripts/lockscreen.sh
		;;
	"Log out")
		echo "Logging out"
		loginctl terminate-user $USER
		;;
	"Suspend")
		echo "Suspending..."
		~/.local/scripts/lockscreen.sh & sleep 3 && systemctl suspend
		;;
esac
