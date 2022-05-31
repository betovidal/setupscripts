#!/usr/bin/bash

# bspwm section taken from https://github.com/polybar/polybar/issues/763#issuecomment-392960721
# Support for multiple wm https://github.com/polybar/polybar/issues/763#issuecomment-445266024

killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch polybar on all monitors and expose the monitor name for internal
# use in polybar configuration.
for m in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$m polybar --reload example &
done
