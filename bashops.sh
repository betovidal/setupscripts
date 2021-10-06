#!/bin/bash

# Backup and delete original files so they're linked by the link.sh script

if [[ ! -f "$HOME/.bashrc.bkp" ]]; then
	cp "$HOME/.bashrc" "$HOME/.bashrc.bkp"
fi
if [[ ! -f "$HOME/.bash_profile.bkp" ]]; then
	cp "$HOME/.bash_profile" "$HOME/.bash_profile.bkp"
fi

rm -f "$HOME/.bashrc"
rm -f "$HOME/.bash_profile"
