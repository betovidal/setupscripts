#!/bin/bash
TARGET=$HOME/Scripts
if [ ! -d "$TARGET" ]; then
	mkdir $TARGET
fi
if [ "$1" == "f" ]; then
	cp scripts/* $TARGET
else
	cp scripts/* $TARGET --interactive
fi

