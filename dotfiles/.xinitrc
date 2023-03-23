#!/bin/sh

# From /etc/X11/xinit/xinitrc #####################

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
userprofile=$HOME/.xprofile
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
profile=/etc/xprofile

# merge in defaults and keymaps
if [ -f $sysresources ]; then
	xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
	xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
	xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
	xmodmap "$usermodmap"
fi

# xprofiles
[ -f $profile ] && . $profile
[ -f "$userprofile" ] && . "$userprofile"

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Starting my own configurations #######################

xset r rate 150 30
xset m 0 0
xset b off
# Set X shaped cursor (needed in bspwm)
xsetroot -cursor_name left_ptr
# $xinput list
# $xinput list-props <id|name>
# $xinput set-prop <id|name> <propname> <value>

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
xinput set-prop "PixArt Microsoft USB Optical Mouse" "libinput Accel Speed" "$ms_basic_accel"
xinput set-prop "Logitech USB Optical Mouse" "libinput Accel Speed" "$logitech_m90_accel"
xinput set-prop "Logitech USB Optical Mouse" "Coordinate Transformation Matrix" "$logitech_m90_speed" 0 0 0 "$logitech_m90_speed" 0 0 0 1
xinput set-prop "ELAN0708:00 04F3:31BF Touchpad" "libinput Disable While Typing Enabled" 0
xinput set-prop "ELAN0708:00 04F3:31BF Touchpad" "libinput Tapping Enabled" 1
# Avoid Android Studio grey screen on startup
export _JAVA_AWT_WM_NONREPARENTING=1
# Kb layout
setxkbmap latam
# For allowing notifications
dunst &
picom &
# sss is a script to launch st with custom colors. Located in ~/.local/bin/sss.
sss -e launch_tmux.bash &

# Setup wallpaper
# Alternative: feh --bg-fill $HOME/Pictures/bg.png &
BG="$HOME/Pictures/bg.png"
if [ -f "$BG" ]; then
    xwallpaper --maximize "$BG"
fi

# Different WMs/DEs if I want to try them

# export XDG_SESSION_TYPE=x11; export GDK_BACKEND=x11; exec gnome-session
# export DESKTOP_SESSION=plasma; exec startplasma-x11
slstatus 2>/dev/null & exec dwm
# exec i3
# sxhkd & exec bspwm
# exec awesome
# exec qtile start
# until wmii; do :; done
