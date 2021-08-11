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
	chromium \
	cmus \
	dhcpcd \
	dillo \
	discord \
	dunst \
	efibootmgr \
	fbv \
	feh \
	firejail \
	ffmpeg \
	ffmpegthumbnailer \
	freerdp \
	gcc \
	git \
	grub \
	i3-wm \
	i3status \
	inkscape \
	irssi \
	jq \
	libnotify \
	linux \
	linux-firmware \
	lm_sensors \
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
	mpv \
	p7zip \
	pkgconf \
	pulseaudio \
	pulseaudio-bluetooth \
	python \
	rofi \
	ruby \
	screenfetch \
	slop \
	stow \
	sudo \
	sxiv \
	terminus-font \
	thunar \
	tigervnc \
	tmux \
	ttf-dejavu \
	tumbler \
	vi \
	vpnc \
	xclip \
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
	mesa \
	mesa-vdpau \
	xf86-video-amdgpu \
	"

for package in $PACKAGES; do
	echo $package
done
sudo pacman -Syu $PACKAGES --needed
