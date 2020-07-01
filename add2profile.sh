#!/bin/bash

# ============ PROFILE ==============
FOLDERS='$HOME/Scripts /opt/NX/bin $HOME/Repos/splatmoji'
TARGET=$HOME/.profile
if [ -f $TARGET ]; then
	for folder in $FOLDERS; do
		count=$(grep -c "$folder" "$TARGET")
		if [ $count -eq "0" ]; then
			echo "if [ -d \"$folder\" ]; then" >> $TARGET
			echo "	PATH=\"$folder:\$PATH\""   >> $TARGET
			echo "fi"                      >> $TARGET
			echo "[OK] $folder"
		else
			echo "[NO] $folder"
		fi
	done
else
	echo "File $TARGET does not exist"
fi

# $1 - target
# $2 - string
function strappend {
	count=$(grep -c "$2" "$1")
	if [ $count -eq "0" ]; then
		echo $2 >> $1
		echo "[OK] $2"
	else
		echo "[NO] $2"
	fi
}
strappend $TARGET "set TERM type"
strappend $TARGET "export TERM=screen-256color"
strappend $TARGET "export EDITOR=vim"
