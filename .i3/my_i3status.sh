#!/bin/sh
# shell script to prepend i3status with free memory

i3status -c ~/.i3/status | while :
do
	read line
	kitty=$(free -h | awk '/Mem:/ { total=$2 } /Mem:/ { used=$3 } END { print used"/"total }')
	echo "$kitty | $line" || exit 1
done
