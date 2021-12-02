#!/bin/bash

VIMREPO=$HOME/Repos/vim
VIMDEST=/opt/vim8

if [ ! -d $VIMREPO ]; then
	echo "vim repo does not exist"
	exit
fi

echo "Configuring VIM..."
cd $VIMREPO

./configure \
--enable-gui=no \
--with-features=normal \
# --enable-python3interp=dynamic \
--enable-multibyte \
--with-x \
--with-compiledby="tocino" \
--prefix=$VIMDEST
# --with-python3-config-dir=/usr/lib/python3.9/config-3.9-x86_64-linux-gnu \

sudo make clean install
git clean -df

BINS="vim vimdiff xxd"

for binary in $BINS; do
	sudo ln -s "$VIMDEST/bin/$binary" "/usr/bin/$binary"
done

cd -
