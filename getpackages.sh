#!/bin/bash
PACKAGES="\
	adduser sudo\
	gcc make man\
	bash-completion git\
	alsa-utils pulseaudio\
	dbus-x11 dunst fonts-noto-color-emoji geany libnotify-bin thunar\
	bc cmus curl feh ffmpeg fim freerdp2-x11 gpick maim mednafen nnn ntfs-3g openfortivpn p7zip-full python3 rofi screenfetch slop sxiv tigervnc-viewer tmux xzoom zathura\
	xclip xsel xdotool xinit xorg\
	nethogs nload\
	libncurses5-dev libx11-dev libxinerama-dev libxft-dev libjpeg-dev libxrandr-dev libxt-dev\
	firmware-realtek\
	firmware-amd-graphics firmware-linux-nonfree libgl1-mesa-dri libglx-mesa0 mesa-vulkan-drivers xserver-xorg-video-all \
	"

for package in $PACKAGES; do
	echo $package
done
sudo apt install $PACKAGES
