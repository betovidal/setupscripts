#!/bin/sh

# Manually install
# - Aseprite https://www.humblebundle.com/ <-- need to login
# - Spotify https://www.spotify.com/us/download/linux/ <-- add pgp
# - NoMachine https://downloads.nomachine.com/linux/?id=1 <-- infinite redirects
# - rpi-imager https://downloads.raspberrypi.org/imager/imager_latest_amd64.deb <-- I won't always need it
# - Freetube https://github.com/FreeTubeApp/FreeTube/releases/download/v0.19.1-beta/freetube_0.19.1_amd64.deb <-- No way to get the latest build without known the version beforehand


PKGS_CACHE="$HOME/.cache/deb-manager"

if [ ! -d "$PKGS_CACHE" ]; then
    mkdir -p "$PKGS_CACHE" 
fi

pkgs="\
    minecraft.deb   https://launcher.mojang.com/download/Minecraft.deb   \
    bitwarden.deb   https://vault.bitwarden.com/download/?app=desktop&platform=linux&variant=deb \
    mullvad.deb     https://mullvad.net/en/download/app/deb/latest       \
    code.deb        https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64 \
"

name=""
url=""
path=""
# i = install, d = download, b = both
download() {
    for token in $pkgs; do
        if [ -z $name ]; then
            name=$token
            continue
        fi
        url=$token
        path="$PKGS_CACHE/$name"
        # Download
        echo "Downloading $name"
        curl -L "$url" -o "$path"
        # clear vars
        name=""
        url=""
        path=
    done
}

install() {
    echo "Installing $name"
    sudo dpkg -R -i "$PKGS_CACHE"
}

case $1 in
    --help|help|h)
        echo "Help"
        ;;
    download|d)
        echo "Download"
        download
        ;;
    install|i)
        echo "Install"
        install
        ;;
    *)
        echo "Download and install"
        download
        install
        ;;
esac
