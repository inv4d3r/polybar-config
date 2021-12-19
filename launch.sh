#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using theme config
# polybar mybar -c ~/.config/polybar/$THEME.config &

# Launch polybars for every connected monitor
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar mybar -c ~/.config/polybar/$THEME.config &
  done
else
  polybar mybar -c ~/.config/polybar/$THEME.config &
fi

echo "Polybar launched..."
