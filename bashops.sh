#!/bin/bash

# Backup and delete original files so they're linked by the link.sh script
profile_file="$HOME/.profile"

if [ ! -f "$HOME/.bashrc.bkp" ]; then
	cp "$HOME/.bashrc" "$HOME/.bashrc.bkp"
fi
if [ ! -f "${profile_file}.bkp" ]; then
	cp "${profile_file}" "${profile_file}.bkp"
fi

rm -f "$HOME/.bashrc"
rm -f "$profile_file"
