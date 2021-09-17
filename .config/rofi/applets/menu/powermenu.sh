#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/powermenu.rasi -location 2"

uptime=$(uptime -p | sed -e 's/up //g')
cpu=$($HOME/.config/rofi/bin/usedcpu)
memory=$($HOME/.config/rofi/bin/usedram)

# Options
shutdown="⏻︁"
reboot="🗘︁"
lock="🔒︁"
suspend=""
logout=""

# Confirmation
confirm_exit() {
	rofi -dmenu\
		-i\
		-no-fixed-num-lines\
		-p "Are You Sure? : "\
		-theme $HOME/.config/rofi/applets/styles/confirm.rasi
}

# Message
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "Available Options  -  yes / y / no / n"
}

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

# i don't want to confirm :)

chosen="$(echo -e "$options" | $rofi_command -p "祥  $uptime  |     $cpu  |  ﬙  $memory " -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
		# ans=$(confirm_exit &)
		# if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
		systemctl poweroff
		# elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
		# 	exit 0
        # else
		# 	msg
        # fi
        ;;
    $reboot)
		# ans=$(confirm_exit &)
		# if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			systemctl reboot
		# elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
		# 	exit 0
        # else
		# 	msg
        # fi
        ;;
    $lock)
		# if [[ -f /usr/bin/i3lock ]]; then
		# 	i3lock
		if [[ -f /usr/bin/betterlockscreen ]]; then
			betterlockscreen -l
		fi
        ;;
    $suspend)
		# ans=$(confirm_exit &)
		# if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			mpc -q pause
			amixer set Master mute
			betterlockscreen -s
			# systemctl suspend
		# elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
		# 	exit 0
        # else
		# 	msg
        # fi
        ;;
    $logout)
		# ans=$(confirm_exit &)
		# if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			if [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
				openbox --exit
			elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
				bspc quit
			elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
				i3-msg exit
			else
				loginctl terminate-user $USER
			fi
		# elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			# exit 0
        # else
			# msg
        # fi
        ;;
esac
