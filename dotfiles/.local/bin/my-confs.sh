#!/bin/sh

# KB CONFIGURATIONS
xset r rate 150 30
xset m 0 0
xset b off
# Kb layout
setxkbmap latam


# MOUSE CONFIGURATIONS

# Set X shaped cursor (needed in bspwm)
xsetroot -cursor_name left_ptr

# For mouse speed, try <libinput Accel Speed|Device Accel Constant Deceleration>
#   (depending on the driver)
# <Coordinate Transformation Matrix> will work too but it'll introduce
#   unexpected behaviour on some SDL applications (e.g. Dota2)

# Feels good but messes up a lot of games
# logitech_m90_speed="1.9"
# logitech_m90_accel="-1"

# Minor accel
logitech_m90_speed="1"
logitech_m90_accel="-0.8"

# Microsoft Mouse
ms_basic_accel="-0.7"

# $xinput list
# $xinput list-props <id|name>
# $xinput set-prop <id|name> <propname> <value>
xinput set-prop "PixArt Microsoft USB Optical Mouse" "libinput Accel Speed" "$ms_basic_accel"
xinput set-prop "Logitech USB Optical Mouse" "libinput Accel Speed" "$logitech_m90_accel"
xinput set-prop "Logitech USB Optical Mouse" "Coordinate Transformation Matrix" "$logitech_m90_speed" 0 0 0 "$logitech_m90_speed" 0 0 0 1
xinput set-prop "ELAN0708:00 04F3:31BF Touchpad" "libinput Disable While Typing Enabled" 0
xinput set-prop "ELAN0708:00 04F3:31BF Touchpad" "libinput Tapping Enabled" 1

# WALLPAPER
# Alternative: feh --bg-fill $HOME/Pictures/bg.png &
BG="$HOME/Pictures/bg.png"
if [ -f "$BG" ]; then
    xwallpaper --maximize "$BG"
fi

