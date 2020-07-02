#!/bin/bash
TARGET=$HOME/Downloads/
if [ ! -d $TARGET ]; then
	mkdir -p $TARGET
fi
POINTERURL="https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US"
LATESTHREF=$(curl $POINTERURL)
URL=$(echo $LATESTHREF | grep -o 'http.*bz2')
# Show only
if [ "$1" == "s" ]; then
	echo $URL
else
	cd $TARGET
	curl -LO $URL
	if [ "$1" == "f" ]; then
		tar xjf firefox-*.tar.bz2
	else
		echo "Uncompress with \$tar xjf firefox-*.tar.bz2"
	fi
	cd -
fi
