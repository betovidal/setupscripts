#!/bin/bash
TARGET=$HOME/Downloads
FFSOURCE=$TARGET/firefox
FFTARGET=/opt
FFBIN=$FFTARGET/firefox/firefox
FFLNK=/usr/bin/firefox
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
	pushd $TARGET
	curl -LO $URL
	if [ "$1" == "f" ]; then
		tar xjf firefox-*.tar.bz2
		echo "Moving firefox to $FFTARGET"
		sudo mv $FFSOURCE $FFTARGET
		echo "Creating symlink"
		sudo ln -s $FFBIN $FFLNK
	else
		echo "Uncompress with \$tar xjf firefox-*.tar.bz2"
	fi
	popd
fi
