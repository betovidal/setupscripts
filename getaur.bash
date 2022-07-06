#!/usr/bin/env bash
# Install yay
# cd "$HOME/Repos/yay"
# makepkg -sirc --needed
# cd -

# Install packages
AURREPOS=(
	"aur/google-earth-pro"
	"aur/lemonbar-git"
	"aur/libxft-bgra"
	"aur/minecraft-launcher"
	"aur/nomachine"
	"aur/pod2man"
	"aur/tuxguitar"
	"aur/vscodium-bin"
	"aur/xtitle"
)
echo ${AURREPOS[*]}
# Unquoted so words are split into different strings
yay -Syu --needed ${AURREPOS[*]}
