#!/bin/bash
APPSTARGET=$HOME/.local/share/applications/
APPS=./applications
if [ ! -d "$APPSTARGET" ]; then
	mkdir -p $APPSTARGET
fi
if [ "$1" == "f" ]; then
	cp $APPS/* $APPSTARGET
else
	cp $APPS/* $APPSTARGET --interactive
fi
