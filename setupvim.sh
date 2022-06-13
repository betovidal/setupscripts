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
--with-features=huge \
--enable-python3interp=dynamic \
--with-python3-command=python \
--enable-multibyte \
--with-x \
--with-compiledby="tocino" \
--prefix=$VIMDEST

sudo make clean install
git clean -df

BINS="vim vimdiff xxd"

for binary in $BINS; do
	sudo ln -sf "$VIMDEST/bin/$binary" "/usr/bin/$binary"
done

cd -
