#!/bin/sh

BLANK='#00000000'
CLEAR='#00000000'
DEFAULT='#282828'
TEXT='#ebdbb2'
WRONG='#cc241d'
VERIFYING='#00000000'

[ ! -f $HOME/.cache/lockscreen.png ] && convert -resize $($HOME/.local/scripts/get_res.sh) $HOME/Pictures/wallpapers/gods_die_too.png $HOME/.cache/lockscreen.png

i3lock \
-i $HOME/.cache/lockscreen.png \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$BLANK     \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$WRONG         \
\
--screen 1                   \
--blur 5                     \
--clock                      \
--time-str="%I:%M %P"        \
--verif-text="Hmmm..."       \
--wrong-text="Wrong!"        \
--no-modkey-text             \
--time-size=50               \
--radius=120
