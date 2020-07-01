#!/bin/bash
PACKAGES="\
	gcc make\
	bash-completion git\
	alsa-utils pulseaudio\
	thunar dbus-x11 dunst libnotify-bin\
	feh xzoom cmus curl gpick screenfetch fim slop maim zathura sxiv p7zip-full\
	xsel xclip\
	ngnix\
	nethogs nload\
	libx11-dev libxinerama-dev libxft-dev libjpeg-dev libxrandr-dev libxt-dev\
	firmware-amd-graphics firmware-linux-nonfree libgl1-mesa-dri libglx-mesa0 mesa-vulkan-drivers xserver-xorg-video-all \
	"

for package in $PACKAGES; do
	echo $package
done
