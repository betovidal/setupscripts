#!/bin/bash
TARGET=$HOME/Downloads/
if [ ! -d $TARGET ]; then
	mkdir -p $TARGET
fi
POINTERURL="https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US"
LATESTHREF=$(curl $POINTERURL)
URL=$(echo $LATESTHREF | grep -o 'http.*bz2')
cd $TARGET
curl -LO $URL
cd -
echo "Uncompress with \$tar xjf firefox-*.tar.bz2"
