#!/bin/bash
RCFILES=./rcfiles/
TARGET=$HOME
for f in $(ls -a $RCFILES); do
	if [ $f != "." ] && [ $f != ".." ]; then
		echo $f
		cp $RCFILES/$f $HOME --interactive
	fi
done
