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
# alacritty &

# Different WMs/DEs if I want to try them

# XFCE
exec startxfce4


# GNOME
# export XDG_SESSION_TYPE=x11; export GDK_BACKEND=x11; exec gnome-session

# KDE PLASMA - Install plasma-meta or plasma. Alternatively install
# plasma-desktop for a minimal plasma installation.
# export DESKTOP_SESSION=plasma; exec startplasma-x11

# DWM - Clone repo, compile and install manually before using.
# slstatus 2>/dev/null & exec dwm

# MATE - install mate and mate-extra packages.
# exec mate-session

# i3
# exec i3

# BSPWM and SXHKD - Make sure to copy installed configurations to home folder
# or use your own
# sxhkd & exec bspwm

# AWESOME - I won't really use it but it's nice to know.
# exec awesome

# QTILE - I won't really use it but it's nice to know.
# exec qtile start

# WMII - I won't really use it but it's nice to know.
# until wmii; do :; done
