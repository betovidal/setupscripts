#!/usr/bin/env bash
# Install yay
# cd "$HOME/Repos/yay"
# makepkg -sirc --needed
# cd -

# Install packages
AURREPOS=(
    "aur/flashplayer-standalone"
    "aur/google-earth-pro"
    "aur/lemonbar-git"
    "aur/libxft-bgra"
    "aur/mcaselector"
    "aur/minecraft-launcher"
    "aur/nomachine"
    "aur/pcloud-drive"
    "aur/pod2man"
    "aur/spotify"
    "aur/tuxguitar"
    "aur/vscodium-bin"
    "aur/xtitle"
    "aur/xzoom"
)
# Update db so yay appears on the list too!
yay -Y --gendb
# Unquoted so words are split into different strings
yay -Syu --needed ${AURREPOS[*]}
