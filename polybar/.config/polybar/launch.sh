#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# if type "xrandr"; then
#   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     MONITOR=$m polybar --reload example &
#   done
# else
#   polybar --reload example &
# fi

# Launch Polybar, using default config location ~/.config/polybar/config
RIGHT_MONITOR=DisplayPort-0 polybar right &
LEFT_MONITOR=HDMI-A-0 polybar left &
echo "Polybar launched..."
