#!/usr/bin/env bash
REPOS_FOLDER=$HOME/Repos/
DEV_FOLDER=$HOME/Development/
flags="--depth 1"
if [ ! -d $REPOS_FOLDER ]; then
	mkdir -p $REPOS_FOLDER
fi
if [ ! -d $DEV_FOLDER ]; then
	mkdir -p $DEV_FOLDER
fi
# Suckless tools
_SUCKLESSTOOLS="dmenu dwm farbfeld sent slock slstatus st"
SUCKLESSTOOLS="st"
echo "= = = = = Suckless Tools = = = = ="
for tool in $SUCKLESSTOOLS; do
	git clone $flags https://git.suckless.org/$tool $REPOS_FOLDER$tool
done
# Other repos
echo "= = = = = Additional Repositories = = = = ="
# Managed in setupvim.bash script
# git clone $flags https://github.com/vim/vim.git "${REPOS_FOLDER}vim"
git clone $flags https://github.com/toadjaune/pulseaudio-config.git "${REPOS_FOLDER}pulseaudio-config"
git clone $flags https://github.com/muennich/sxiv.git "${REPOS_FOLDER}sxiv"
# git clone $flags https://github.com/cspeterson/splatmoji.git "${REPOS_FOLDER}splatmoji"

# My repos
echo "= = = = = My Own Repositories = = = = ="
MYREPOS="setupscripts"
for myrepo in $MYREPOS; do
	git clone https://github.com/betovidal/$myrepo.git $DEV_FOLDER$myrepo
done

# Setup vim-plug
echo "= = = = = Setting up vim-plug = = = = ="
PLUGSCRIPT="$HOME/.vim/autoload/plug.vim"
if [ ! -f "$PLUGSCRIPT" ]; then
    curl -fLo "$PLUGSCRIPT" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
