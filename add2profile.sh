#!/bin/bash

# ============ PROFILE ==============
FOLDERS='/usr/NX/bin $HOME/Repos/splatmoji $HOME/Android/Studio/bin $HOME/.local/bin'
TARGETPROF=$HOME/.bash_profile
TARGETBASH=$HOME/.bashrc
if [ -f $TARGETPROF ]; then
	for folder in $FOLDERS; do
		count=$(grep -c "$folder" "$TARGETPROF")
		if [ "$count" -eq "0" ]; then
			echo "if [ -d \"$folder\" ]; then" >> $TARGETPROF
			echo "	PATH=\"$folder:\$PATH\""   >> $TARGETPROF
			echo "fi"                      >> $TARGETPROF
			echo "[OK] $folder"
		else
			echo "[NO] $folder"
		fi
	done
else
	echo "File $TARGETPROF does not exist"
fi

# $1 - target
# $2 - string
function strappend {
	count=$(grep -c "$2" "$1")
	echo $count
	if [ "$count" -eq "0" ]; then
		echo $2 >> $1
		echo "[OK] $2"
	else
		echo "[NO] $2"
	fi
}
strappend $TARGETPROF "export TERM=screen-256color"
strappend $TARGETPROF "export EDITOR=vim"
strappend $TARGETPROF "export JAVA_HOME=/usr/lib/jvm/default"
strappend $TARGETPROF 'source $HOME/.bashrc'
strappend $TARGETBASH 'source $HOME/.local/bin/complete-my-scripts.sh'
