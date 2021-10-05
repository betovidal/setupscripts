#!/bin/bash
FOLDERS_LINE="Downloads Music Pictures Videos Documents"
IFS=' ' read -a FOLDERS <<< "$FOLDERS_LINE"

for folder in "${FOLDERS[@]}"; do
	unlink "$HOME/.wine/drive_c/users/tocino/$folder"
	mkdir "$HOME/.wine/drive_c/users/tocino/$folder"
done


