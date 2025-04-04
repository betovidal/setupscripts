#!/bin/bash
FOLDERS_LINE="Downloads Music Pictures Videos Documents Desktop"
IFS=' ' read -a FOLDERS <<< "$FOLDERS_LINE"

for folder in "${FOLDERS[@]}"; do
	unlink "$HOME/.wine/drive_c/users/red/$folder"
	mkdir "$HOME/.wine/drive_c/users/red/$folder"
done


