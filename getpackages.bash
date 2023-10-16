#!/usr/bin/env bash

# DEBIAN
DEBIAN_PACKAGES="\
	adduser \
	alsa-utils \
	arandr \
	baobab \
	bash-completion \
	bc \
	bluez \
	bluez-tools \
	bspwm \
	calibre \
	catfish \
	chromium \
	curl \
	dbus-x11 \
	dillo \
	dunst \
	evince \
	fim \
	firmware-realtek \
	firmware-amd-graphics \
	firmware-linux-nonfree \
	ffmpeg \
	ffmpegthumbnailer \
	fonts-noto-color-emoji \
	fonts-symbola \
	freerdp2-x11 \
	gcc \
	git\
	gpick \
	jq \
	libnotify-bin \
	lingot \
	maim \
	make \
	man \
	nethogs \
	net-tools \
	nload \
	nnn \
	ntfs-3g \
	openssh-client \
	openssh-server \
	p7zip-full \
	pulseaudio \
	pulseaudio-module-bluetooth \
	python3 \
	rofi \
	screenfetch \
	slop \
	stow\
	sudo \
	sxiv \
	tigervnc-viewer \
	tmux \
	tumbler-plugins-extra \
	thunar \
	xclip \
	xdotool \
	\
	xfce4 \
	xfce4-mpc-plugin \
	xfce4-power-manager \
	xfce4-pulseaudio-plugin \
	xfce4-taskmanager \
	\
	xinit \
	xorg \
	xsel \
	xzoom \
	zathura \
	\
	libncurses5-dev \
	libx11-dev \
	libxinerama-dev \
	libxft-dev \
	libjpeg-dev \
	libxrandr-dev \
	libxt-dev \
	libgl1-mesa-dri \
	libglx-mesa0 \
	mesa-vulkan-drivers \
	xserver-xorg-video-all \
	"

# ARCH
ARCH_PKGS="\
	acpilight \
	alsa-card-profiles \
	alsa-utils \
	arandr \
	archlinux-keyring \
	baobab \
	base \
	base-devel \
	bash-completion \
	bc \
	bluez \
	bluez-utils \
	bspwm \
	calibre \
	catfish \
	chromium \
	coolreader \
	dhcpcd \
	dillo \
	discord \
	dunst \
	efibootmgr \
	espeak-ng \
	espeak-ng-espeak \
	evince \
	fbv \
	file-roller \
	firefox \
	firefox-developer-edition \
	firejail \
	ffmpeg \
	ffmpegthumbnailer \
	freerdp \
	fzf \
	gcc \
	git \
	gmtp \
	grub \
	guvcview \
	gsimplecal \
	htop \
	i3lock \
	inetutils \
	inkscape \
	inotify-tools \
	irssi \
	jq \
	leafpad \
	libnotify \
	libxml2 \
	linux \
	linux-firmware \
	lm_sensors \
	lua \
	lxappearance-gtk3 \
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
	picom \
	pkgconf \
	plantuml \
	polybar \
	pulseaudio \
	pulseaudio-alsa \
	pulseaudio-bluetooth \
	pulsemixer \
	python \
	qbittorrent \
	qtqr \
	retext \
	ripgrep \
	rofi \
	rofi-emoji \
	screenfetch \
	seahorse \
	slop \
	sox \
	stow \
	sudo \
	sxhkd \
	sxiv \
	task \
	terminus-font \
	thunar \
	thunar-archive-plugin \
	tidy \
	tigervnc \
	tk \
	tmux \
	ttf-baekmuk \
	ttf-dejavu \
	ttf-hanazono \
	ttf-liberation \
	tumbler \
	vi \
	vpnc \
	xchm \
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
	xwallpaper \
	zathura \
	zathura-pdf-mupdf \
	zbar \
	\
	blueman \
	xfce4 \
	xfce4-mpc-plugin \
	xfce4-power-manager \
	xfce4-pulseaudio-plugin \
	xfce4-taskmanager \
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
"
MAC_UI_PKGS="\
    android-studio \
    firefox \
    iterm2 \
    microsoft-remote-desktop \
    microsoft-teams
    nomachine \
"
MAC_CLI_PKGS="\
    bash-completion@2 \
    ffmpeg \
    git \
    jq \
    nnn \
    node \
    openjdk \
    plantuml \
    python3 \
    stow \
    tmux \
    vim \
"
# amdgpu packages as described here
#   https://wiki.archlinux.org/title/AMDGPU#Installation
# virt-manager packages described here
#   https://wiki.archlinux.org/title/libvirt

if [ "$1" == "mac" ]; then
    brew install $MAC_CLI_PKGS
    brew install --cask $MAC_UI_PKGS
else
    # for package in $ARCH_PKGS; do
    #     echo $package
    # done
    sudo pacman -Syu $ARCH_PKGS --needed
fi
