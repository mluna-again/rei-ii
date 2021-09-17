#!/bin/bash
if pgrep -x "picom" > /dev/null
then
	killall picom
else
	picom -b --experimental-backends --config ~/.xmonad/scripts/picom.conf
fi
