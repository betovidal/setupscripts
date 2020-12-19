#!/bin/bash
# So, this and all.sh should be executed from the parent folder
RCFILES="$(pwd)/rcfiles"
TARGET=$HOME
for f in $(ls -a $RCFILES); do
	if [ "$f" != "." ] && [ "$f" != ".." ]; then
		if [ "$1" == "f" ]; then
			ln -sf $RCFILES/$f $HOME
		else
			ln -s  $RCFILES/$f $HOME
		fi
	fi
done
