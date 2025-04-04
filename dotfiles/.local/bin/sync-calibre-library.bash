#!/usr/bin/env bash

rsync -a -P -e "ssh" "$HOME/Calibre Library/" hp-wifi:"~/Calibre Library"
