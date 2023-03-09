#!/usr/bin/env bash
# Install yay
YAYDIR="$HOME/.cache/yay/yay-bin"
if [ ! -d "$YAYDIR" ]; then
    mkdir -p "$YAYDIR"
    git clone https://aur.archlinux.org/yay-bin.git "$YAYDIR"
fi

pushd "$YAYDIR"
    makepkg -sirc --needed
popd

# Install packages
AURREPOS=(
    "aur/downgrade",
    "aur/flashplayer-standalone"
    "aur/google-earth-pro"
    "aur/lemonbar-git"
    # "aur/libxft-bgra" # Patches are available in upstream now.
    "aur/mcaselector"
    "aur/minecraft-launcher"
    "aur/nomachine"
    "aur/pcloud-drive"
    "aur/pcloudcc-git "
    "aur/pod2man"
    "aur/spotify"
    # "aur/tuxguitar" # Install on demand. It's slow to reinstall everytime.
    "aur/vscodium-bin-marketplace" # This installs vscodium-bin as a dependency
    "aur/xtitle"
    "aur/xzoom"
)
# Update db so yay appears on the list too!
yay -Y --gendb
# Unquoted so words are split into different strings
yay -Syu --needed ${AURREPOS[*]}
