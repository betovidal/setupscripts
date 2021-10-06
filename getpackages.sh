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
	blender \
	bluez \
	bluez-utils \
	bspwm \
	catfish \
	chromium \
	cmus \
	dhcpcd \
	dillo \
	discord \
	dunst \
	efibootmgr \
	fbv \
	feh \
	file-roller \
	firejail \
	ffmpeg \
	ffmpegthumbnailer \
	freerdp \
	gcc \
	git \
	grub \
	gsimplecal \
	inkscape \
	inotify-tools \
	irssi \
	jdk-openjdk \
	jq \
	leafpad \
	libnotify \
	linux \
	linux-firmware \
	lm_sensors \
	maim \
	make \
	man \
	mpv \
	mpc \
	mpd \
	net-tools \
	nethogs \
	nload \
	nnn \
	noto-fonts-emoji \
	ntfs-3g \
	openssh \
	os-prober \
	p7zip \
	pavucontrol \
	picom \
	pkgconf \
	plantuml \
	pulseaudio \
	pulseaudio-bluetooth \
	python \
	rofi \
	screenfetch \
	seahorse \
	slop \
	stow \
	sudo \
	sxhkd \
	sxiv \
	task \
	terminus-font \
	thunar \
	thunar-archive-plugin \
	tigervnc \
	tk \
	tmux \
	ttf-dejavu \
	tumbler \
	vi \
	vim \
	vpnc \
	xclip \
	xdo \
	xdotool \
	xorg-mkfontscale \
	xorg-server \
	xorg-xev \
	xorg-xfontsel \
	xorg-xinit \
	xorg-xinput \
	xsel \
	zathura \
	zathura-pdf-mupdf \
	\
	mesa
	mesa-vdpau \
	xf86-video-amdgpu \
	libva-mesa-driver \
	\
	qemu \
	libvirt \
	virt-manager \
	virt-viewer
	lxqt-policykit \
	dnsmasq \
	iptables-nft \
	edk2-ovmf \
	\
	"
# virt-manager packages described here
#   https://wiki.archlinux.org/title/libvirt
# amdgpu packages as described here
#   https://wiki.archlinux.org/title/AMDGPU#Installation

for package in $PACKAGES; do
	echo $package
done
sudo pacman -Syu $PACKAGES --needed
