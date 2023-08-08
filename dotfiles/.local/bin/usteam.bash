#!/usr/bin/env bash

STEAM_FOLDER="$HOME/.steam/steam/steamapps"
if [ -d "$STEAM_FOLDER" ]; then
    sed -i 's/\("AutoUpdateBehavior".*\)"0"/\1"1"/' "${STEAM_FOLDER}"/*.acf
    echo "Modified games configurations to be updated on launch only."
fi
