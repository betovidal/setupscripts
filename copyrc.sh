#!/bin/bash
RCFILES=./rcfiles/
TARGET=$HOME
for f in $(ls -a $RCFILES); do
	if [ "$f" != "." ] && [ "$f" != ".." ]; then
		if [ "$1" == "f" ]; then
			cp $RCFILES/$f $HOME
		else
			cp $RCFILES/$f $HOME --interactive
		fi
	fi
done
