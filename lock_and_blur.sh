#!/usr/bin/env bash

# set the icon and a temporary location for the screenshot to be stored
icon="$HOME/Pictures/white-lock-icon-png-65.png"
tmpbg='/tmp/screen.png'

# take a screenshot
#if [ -d "$tmpbg" ]; then
#	echo "here"
#	sudo rm "$tmpbg"
#	scrot "$tmpbg"
#    # Will enter here if $DIRECTORY exists, even if it contains spaces
#else
#	echo "$tmpbg"
#	scrot "$tmpbg"
#fi

rm /tmp/screen*.png
scrot "$tmpbg"

# blur the screenshot by resizing and scaling back up
convert "$tmpbg" -filter Gaussian -thumbnail 20% -sample 500% "$tmpbg"

# overlay the icon onto the screenshot
convert "$tmpbg" "$icon" -gravity center -composite "$tmpbg"

# lock the screen with the blurred screenshot
i3lock -i "$tmpbg"
