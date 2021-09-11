#! /bin/bash


IFS='\n'
echo '(box :orientation "v" :class "notifications-list"'
for notification in $(tail -10 ~/.config/eww/scripts/notifications/list.text | sed '$!N;s/\n/  /'); do
	title=$(awk -F " " '{ print $1 }' <<< $notification)
	content=$(awk -F " " '{ print $2 }' <<< $notification)
	echo $title $content
	# echo '(box :orientation "v"'
	# echo "(label :text \"$title\" :class 'notifications-item-title')"
	# echo "(label :text \"$content\" :class 'notifications-item-content')"
	# echo ')'
done
echo ")"
