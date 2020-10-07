#!/bin/bash
PACKAGES="\
	adduser sudo\
	gcc make man\
	bash-completion git\
	alsa-utils pulseaudio pulseaudio-module-bluetooth\
	fonts-noto-color-emoji fonts-symbola\
	dbus-x11 dunst libnotify-bin ffmpegthumbnailer tumbler-plugins-extra\
	geany thunar mednafen zathura xzoom gpick\
	bc cmus curl feh ffmpeg fim freerdp2-x11 maim nnn ntfs-3g\
	openfortivpn p7zip-full python3 rofi screenfetch slop sxiv\
	tigervnc-viewer tmux\
	xclip xsel xdotool xinit xorg\
	nethogs nload\
	libncurses5-dev libx11-dev libxinerama-dev libxft-dev\
	libjpeg-dev libxrandr-dev libxt-dev\
	firmware-realtek\
	firmware-amd-graphics firmware-linux-nonfree libgl1-mesa-dri\
	libglx-mesa0 mesa-vulkan-drivers xserver-xorg-video-all\
	"

for package in $PACKAGES; do
	echo $package
done
sudo apt install $PACKAGES
