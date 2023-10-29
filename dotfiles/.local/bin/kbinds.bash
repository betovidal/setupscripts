#!/usr/bin/env bash

# Usage:
# kbinds.bash COMPONENT ACTION [ARGS]
# COMPONENT - bright | emoji | lock | music | screen_cap | vol

function bright_handler() {
    case $1 in
        up)
            xbacklight -inc 5
            ;;
        down)
            xbacklight -dec 5
            ;;
    esac
}

function emoji_handler() {
    rofi -monitor -1 -modi emoji -show emoji -disable-history -scroll-method
}

function launcher_handler() {
    rofi -monitor -1 -modi run,drun -show run -show-icons -disable-history -scroll-method 1
}

function lock_handler() {
    i3lock -u -t --image "$HOME/Pictures/lock.png"
}

# Separate it in the future to handle other players too (e.g. cmus).
function music_handler() {
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
            mpc seek +5
            ;;
        find)
            mpc playlist | rofi -monitor -1 -format d -dmenu -i -scroll-method 1 | xargs -r mpc play
            ;;
        info)
            notify-send -t 1000 "♪" "$(mpc status | sed '1q;d')"
            ;;
    esac
}

function screen_cap_handler() {
    case $1 in
        sel_cb)
            maim -u -s | xclip -selection clipboard -t image/png
            ;;
        all_cb)
            maim -u | xclip -selection clipboard -t image/png
            ;;
    esac
}

function vol_handler() {
    case $1 in
        up)
            pactl set-sink-volume @DEFAULT_SINK@ +2.5%
            ;;
        down)
            pactl set-sink-volume @DEFAULT_SINK@ -2.5%
            ;;
        mute)
            pactl set-sink-mute @DEFAULT_SINK@ toggle
            ;;
    esac
}

case $1 in
    bright)
        bright_handler $2
        ;;
    emoji)
        emoji_handler
        ;;
    launcher)
        launcher_handler
        ;;
    lock)
        lock_handler
        ;;
    music)
        music_handler $2
        ;;
    screen_cap)
        screen_cap_handler $2
        ;;
    vol)
        vol_handler $2
        ;;
esac
