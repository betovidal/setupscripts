#!/bin/bash
# DEBIAN
# PACKAGES="\
# 	adduser sudo\
# 	gcc make man stow\
# 	bash-completion git\
# 	alsa-utils pulseaudio pulseaudio-module-bluetooth\
# 	fonts-noto-color-emoji fonts-symbola\
# 	dbus-x11 dunst libnotify-bin ffmpegthumbnailer tumbler-plugins-extra\
# 	geany thunar mednafen zathura xzoom gpick lingot\
# 	bc cmus curl feh ffmpeg fim freerdp2-x11 maim nnn ntfs-3g\
# 	p7zip-full python3 rofi screenfetch slop sxiv jq\
# 	tigervnc-viewer tmux\
# 	xclip xsel xdotool xinit xorg\
# 	nethogs nload net-tools\
# 	libncurses5-dev libx11-dev libxinerama-dev libxft-dev\
# 	libjpeg-dev libxrandr-dev libxt-dev\
# 	firmware-realtek\
# 	firmware-amd-graphics firmware-linux-nonfree libgl1-mesa-dri\
# 	libglx-mesa0 mesa-vulkan-drivers xserver-xorg-video-all\
# 	"

# ARCH
PACKAGES="\
	alsa-utils \
	amd-ucode \
	base \
	base-devel \
	bash-completion \
	bc \
	cmus \
	dhcpcd \
	dunst \
	efibootmgr \
	feh \
	ffmpeg \
	freerdp \
	gcc \
	git \
	grub \
	jq \
	libnotify \
	linux \
	linux-firmware \
	maim \
	make \
	man \
	net-tools \
	nethogs \
	nload \
	nnn \
	noto-fonts-emoji \
	ntfs-3g \
	openssh \
	os-prober \
	p7zip \
	pkgconf \
	pulseaudio \
	pulseaudio-bluetooth \
	python \
	python-pip \
	rofi \
	screenfetch \
	slop \
	stow \
	sudo \
	sxiv \
	terminus-font \
	thunar \
	tmux \
	ttf-dejavu \
	vi \
	xclip \
	xdotool \
	xorg-mkfontscale \
	xorg-server \
	xorg-xev \
	xorg-xfontsel \
	xorg-xinit \
	xsel \
	zathura \
	zathura-pdf-mupdf \
	"

for package in $PACKAGES; do
	echo $package
done
sudo pacman -Syu install $PACKAGES --needed
