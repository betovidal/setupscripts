#!/bin/sh

HOST=$1

if [ -z $HOST ]; then
	echo "Host file not specified"
	exit 1
fi
FILE_ROUTE=~/Remotes/$HOST
if [ ! -f $FILE_ROUTE ]; then
	echo "Config file for specified host not found"
	exit 1
fi
$(cat $FILE_ROUTE)
