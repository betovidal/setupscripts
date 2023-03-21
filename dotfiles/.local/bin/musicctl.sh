#!/usr/bin/env bash

# Half of these are not even necessary but I'll keep them here
# for consistency and in case I want to add a different player (e.g. cmus)

case $1 in
    next)
        mpc next
        notify-send -t 1000 "♪" "$(mpc status | sed '1q;d')"
        ;;
    prev)
        mpc prev
        notify-send -t 1000 "♪" "$(mpc status | sed '1q;d')"
        ;;
    toggle)
        mpc toggle
        ;;
    stop)
        mpc stop
        ;;
    rewind)
        mpc seek -5
        ;;
    forward)
        mpc seek -5
        ;;
    find)
        mpc playlist | rofi -monitor -1 -format d -dmenu -i -scroll-method 1 | xargs -r mpc play
        ;;
    info)
        notify-send -t 1000 "♪" "$(mpc status | sed '1q;d')"
        ;;
esac
