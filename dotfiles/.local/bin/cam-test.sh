#!/bin/bash
DEVNUM="0"
# List only
if [ "$1" = "-l" ]; then
	find /dev/ -iname "video*"
	exit
fi
# Default to zero
if [ ! -z "$1" ]; then
	DEVNUM="$1"
fi
# Use specified dev num
DEV="/dev/video$DEVNUM"
# Check if character file device exists
# https://tldp.org/LDP/abs/html/fto.html
if [ ! -c  $DEV ]; then
	echo "$DEV device does not exist!"
	exit
fi
echo "Using device $DEV"
ffplay -f v4l2 -i "$DEV"
