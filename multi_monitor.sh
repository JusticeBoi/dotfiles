#!/usr/bin/env bash

xrandr --output eDP1 --off

xrandr --output DP1 --auto --left-of DP2

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload topbar &
done

