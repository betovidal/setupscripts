#!/bin/bash

VIMREPO=$HOME/Repos/vim
VIMDEST="/opt/vim"

if [ ! -d "$VIMREPO" ]; then
    mkdir -p "$VIMREPO"
    git clone  --depth 1 "https://github.com/vim/vim" "$VIMREPO"
fi

echo "Configuring VIM..."
pushd "$VIMREPO"

./configure \
--enable-gui=no \
--with-features=huge \
--enable-python3interp=dynamic \
--enable-luainterp=dynamic \
--enable-multibyte \
--with-x \
--with-compiledby="tocino" \
--prefix=$VIMDEST

sudo make clean install
git clean -df

VIM_BINS="vim vimdiff xxd"

for vim_bin in $VIM_BINS; do
    sudo ln -sf "$VIMDEST/bin/$vim_bin" "/usr/bin/$vim_bin"
done

popd
