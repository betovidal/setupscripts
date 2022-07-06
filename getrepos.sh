#!/usr/bin/env bash
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
_SUCKLESSTOOLS="dmenu dwm farbfeld sent slock slstatus st"
SUCKLESSTOOLS="st"
echo "= = = = = Suckless Tools = = = = ="
for tool in $SUCKLESSTOOLS; do
	git clone https://git.suckless.org/$tool $REPOS_FOLDER$tool
done
# Other repos
echo "= = = = = Additional Repositories = = = = ="
git clone https://github.com/vim/vim.git "${REPOS_FOLDER}vim"
git clone https://github.com/cspeterson/splatmoji.git "${REPOS_FOLDER}splatmoji"
git clone https://github.com/toadjaune/pulseaudio-config.git "${REPOS_FOLDER}pulseaudio-config"
git clone https://aur.archlinux.org/yay.git "${REPOS_FOLDER}yay"

# My repos
echo "= = = = = My Own Repositories = = = = ="
MYREPOS="setupscripts"
for myrepo in $MYREPOS; do
	git clone https://github.com/betovidal/$myrepo.git $DEV_FOLDER$myrepo
done

# Setup vim-plug
echo "= = = = = Setting up vim-plug = = = = ="
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
