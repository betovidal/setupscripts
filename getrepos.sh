#!/bin/bash
REPOS_FOLDER=$HOME/Repos/
DEV_FOLDER=$HOME/Development/
AUR_FOLDER=$HOME/AUR/
if [ ! -d $REPOS_FOLDER ]; then
	mkdir -p $REPOS_FOLDER
fi
if [ ! -d $DEV_FOLDER ]; then
	mkdir -p $DEV_FOLDER
fi
if [ ! -d $AUR_FOLDER ]; then
	mkdir -p $AUR_FOLDER
fi
# Suckless tools
_SUCKLESSTOOLS="dwm farbfeld sent slstatus"
SUCKLESSTOOLS="dmenu slock st"
echo "= = = = = Suckless Tools = = = = ="
for tool in $SUCKLESSTOOLS; do
	git clone https://git.suckless.org/$tool $REPOS_FOLDER$tool
done
# Other repos
echo "= = = = = Additional Repositories = = = = ="
git clone https://github.com/vim/vim.git $REPOS_FOLDER"vim"
git clone https://github.com/cspeterson/splatmoji.git $REPOS_FOLDER"splatmoji"
# AUR repos
echo "= = = = = AUR packages = = = = ="
AURREPOS="libxft-bgra minecraft-launcher nomachine tuxguitar"
for aurrepo in $AURREPOS; do
	git clone https://aur.archlinux.org/$aurrepo.git $AUR_FOLDER$aurrepo
done

# My repos
echo "= = = = = My Own Repositories = = = = ="
MYREPOS="setupscripts"
for myrepo in $MYREPOS; do
	git clone https://github.com/betovidal/$myrepo.git $DEV_FOLDER$myrepo
done

# Setup vim-plug
echo "= = = = = Setting up vim-plug = = = = ="
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
