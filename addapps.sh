#!/bin/bash
APPSTARGET=$HOME/.local/share/applications/
APPS=./applications
if [ ! -d $APPS ]; then
	mkdir -p $APPS
fi
cp $APPS/* $APPSTARGET --interactive
