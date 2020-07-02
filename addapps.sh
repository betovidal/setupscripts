#!/bin/bash
APPSTARGET=$HOME/.local/share/applications/
APPS=./applications
if [ ! -d "$APPS" ]; then
	mkdir -p $APPS
fi
if [ "$1" == "f" ]; then
	cp $APPS/* $APPSTARGET
else
	cp $APPS/* $APPSTARGET --interactive
fi
