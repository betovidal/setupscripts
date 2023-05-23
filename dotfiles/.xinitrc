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
# KB, mouse and wallpaper are configured here.
myconfs="$HOME/.local/bin/my-confs.sh"
[ -f "$myconfs" ] && . "$myconfs"

# Avoid Android Studio grey screen on startup
export _JAVA_AWT_WM_NONREPARENTING=1

# For allowing notifications
dunst &
picom &
# sss is a script to launch st with custom colors. Located in ~/.local/bin/sss.
sss -e launch_tmux.bash &

# Different WMs/DEs if I want to try them

# export XDG_SESSION_TYPE=x11; export GDK_BACKEND=x11; exec gnome-session
# export DESKTOP_SESSION=plasma; exec startplasma-x11
slstatus 2>/dev/null & exec dwm
# exec i3
# sxhkd & exec bspwm
# exec awesome
# exec qtile start
# until wmii; do :; done
