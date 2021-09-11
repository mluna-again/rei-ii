#! /bin/bash

[ ! -d $HOME/Pictures/screenshots ] && mkdir $HOME/Pictures/screenshots
maim $([ -n "$1" ] && echo "-us" || echo "-u") | tee "$HOME/Pictures/screenshots/$(date +%c).png" | xclip -selection clipboard -t image/png && notify-send 'Snap!' 'Screenshot saved and copied to clipboard'
