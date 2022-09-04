#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Set colors according to those defined by wal
source "${HOME}/.cache/wal/colors.sh"
background=$color0
foreground=$color7
tertiary=$color2
fourth=$color4

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

polybar --reload main &


# if type "xrandr"; then
#   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     MONITOR=$m polybar --reload main -r&
#     #MONITOR=$m polybar --reload external -r&
#     #MONITOR=$m polybar --reload default -r& 
#   done
# else
#   polybar --reload main &
# fi
