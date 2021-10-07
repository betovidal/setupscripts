#!/bin/sh

# From /etc/X11/xinit/xinitrc #####################

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

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
# Set X shaped cursor (needed in bspwm)
xsetroot -cursor_name left_ptr
# $xinput list
# $xinput list-props <id|name>
# $xinput set-prop <id|name> <propname> <value>
# For mouse speed, try <libinput Accel Speed|Device Accel Constant Deceleration>
#   (depending on the driver)
xinput set-prop "PixArt Microsoft USB Optical Mouse" "libinput Accel Speed" -0.4
# Avoid Android Studio grey screen on startup
export _JAVA_AWT_WM_NONREPARENTING=1
# Kb layout
setxkbmap latam
# slstatus &
# For allowing notifications
dunst &
feh --bg-fill ~/Pictures/bg.png &
picom &
# exec dwm
# exec i3
sxhkd &
exec bspwm
