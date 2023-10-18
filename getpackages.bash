#!/usr/bin/env bash

# DEBIAN
DEBIAN_PACKAGES="\
	aisleriot \
	alacritty \
	alsa-utils \
	arandr \
	baobab \
	bash-completion \
	bc \
	binutils \
	blueman \
	bluez \
	bluez-tools \
	bsdgames \
	bspwm \
	calibre \
	catfish \
	chromium \
	curl \
	dbus-x11 \
	dillo \
	dunst \
	evince \
	firefox-esr \
	firmware-linux-nonfree \
	firmware-realtek \
	ffmpeg \
	ffmpegthumbnailer \
	fonts-baekmuk \
	fonts-dejavu-extra \
	fonts-hanazono \
	fonts-liberation2 \
	fonts-noto-color-emoji \
	fonts-symbola \
	fonts-terminus-otb \
	freerdp2-x11 \
	fzf \
	gcc \
	ghostwriter \
	git \
	gmtp \
	gnome-calculator \
	guvcview \
	gsimplecal \
	gpick \
	htop \
	i3 \
	i3lock \
	inkscape \
	inotify-tools \
	irssi \
	jq \
	kruler \
	l3afpad \
	libnotify-bin \
	libxml2-utils \
	lingot \
	lm-sensors \
	maim \
	make \
	man \
	mpv \
	mpc \
	mpd \
	net-tools \
	nethogs \
	network-manager \
	nload \
	nnn \
	ntfs-3g \
	openssh-client \
	openssh-server \
	otpclient \
	p7zip-full \
	pavucontrol \
	picom \
	plantuml \
	polybar \
	pulseaudio \
	pulseaudio-module-bluetooth \
	pulseaudio-utils \
	pulsemixer \
	python3 \
	qbittorrent \
	qtqr \
	ripgrep \
	rofi \
	screenfetch \
	seahorse \
	simplescreenrecorder \
	slop \
	sox \
	speedtest-cli \
	stow\
	sudo \
	sxhkd \
	sxiv \
	taskwarrior \
	thunar \
	thunar-archive-plugin \
	tidy \
	tig \
	tigervnc-viewer \
	tk \
	tmux \
	tumbler-plugins-extra \
	thunar \
	thunderbird \
	vim-gtk3 \
	vpnc \
	x11-utils \
	xchm \
	xclip \
	xdo \
	xdotool \
	xsel \
	xwallpaper \
	xz-utils \
	xzoom \
	yt-dlp \
	zbar-tools \
	zbarcam-gtk \
	\
	xfce4 \
	xfce4-mpc-plugin \
	xfce4-power-manager \
	xfce4-pulseaudio-plugin \
	xfce4-screenshooter \
	xfce4-taskmanager \
	\
	firmware-amd-graphics \
	libgl1-mesa-dri \
	libglx-mesa0 \
	mesa-vulkan-drivers \
	xserver-xorg-video-all \
	\
	qemu-system \
	libvirt-daemon-system \
	virt-manager \
	\
	"

# I will be using gvim instead of compiling vim myself.
# I'm using xfce instead of dwm.
# These were the packages used to compile vim and some suckless tools.
# libncurses5-dev \
# libx11-dev \
# libxinerama-dev \
# libxft-dev \
# libjpeg-dev \
# libxrandr-dev \
# libxt-dev \

# ARCH
ARCH_PKGS="\
	acpilight \
	aisleriot \
	alacritty \
	alsa-card-profiles \
	alsa-utils \
	arandr \
	archlinux-keyring \
	baobab \
	base \
	base-devel \
	bash-completion \
	bc \
	blueman \
	bluez \
	bluez-utils \
	bsd-games \
	bspwm \
	calibre \
	catfish \
	chromium \
	coolreader \
	curl \
	dhcpcd \
	dillo \
	discord \
	dunst \
	efibootmgr \
	evince \
	firefox \
	firefox-developer-edition \
	ffmpeg \
	ffmpegthumbnailer \
	freerdp \
	fzf \
	gcc \
	ghostwriter \
	git \
	gmtp \
	gnome-calculator \
	guvcview \
	gsimplecal \
	gvim \
	htop \
	i3lock \
	inetutils \
	inkscape \
	inotify-tools \
	irssi \
	jq \
	kruler \
	l3afpad \
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
	networkmanager \
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
	polybar \
	pulseaudio \
	pulseaudio-alsa \
	pulseaudio-bluetooth \
	pulsemixer \
	python \
	qbittorrent \
	qtqr \
	ripgrep \
	rofi \
	rofi-emoji \
	screenfetch \
	seahorse \
	simplescreenrecorder \
	slop \
	sox \
	speedtest-cli \
	stow \
	sudo \
	sxhkd \
	sxiv \
	task \
	terminus-font \
	thunar \
	thunar-archive-plugin \
	thunderbird \
	tidy \
	tig \
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
	xort-xprop \
	xsel \
	xwallpaper \
	yt-dlp \
	zbar \
	\
	xfce4 \
	xfce4-mpc-plugin \
	xfce4-power-manager \
	xfce4-pulseaudio-plugin \
	xfce4-screenshooter \
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
# ARCHLINUX
# amdgpu packages as described here
#   https://wiki.archlinux.org/title/AMDGPU#Installation
# virt-manager packages described here
#   https://wiki.archlinux.org/title/libvirt

# DEBIAN
# amdgpu packages as described here
#   https://wiki.debian.org/AtiHowTo#Installation
# virt-manager packages described here
#   https://wiki.debian.org/KVM#Installation

if [ "$1" == "mac" ]; then
    brew install $MAC_CLI_PKGS
    brew install --cask $MAC_UI_PKGS
elif [ "$1" == "debian" ]; then
    sudo apt install $DEBIAN_PACKAGES
    echo "WARNING! Do not forget to uninstall xdg-desktop-portal as it makes"
    echo "Firefox and other programs start very slowly."
    echo "Run:"
    echo "apt remove --purge xdg-desktop-portal"
    echo "apt autoremove"
else
    # for package in $ARCH_PKGS; do
    #     echo $package
    # done
    sudo pacman -Syu $ARCH_PKGS --needed
fi
