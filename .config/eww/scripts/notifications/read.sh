#! /bin/bash

[ ! -f $HOME/.cache/notifications ] && echo "(label :text 'Come back later...' :class 'notifications-empty')" && exit 0

echo "(box :orientation 'v'"
tail -n 7 $HOME/.cache/notifications | while read line; do
  echo "(box :orientation 'v' :class 'notification-wrapper'"

  title=$(awk -F " please-dont-write-me " '{ print $1 }' <<< $line)
  content=$(awk -F " please-dont-write-me " '{ print $2 }' <<< $line)

  echo "(label :halign 'start' :text \"$title\" :class 'notification-title')"
  echo "(label :halign 'start' :text \"$content\" :class 'notification-content')"

  echo ")"
done 
echo ")"
