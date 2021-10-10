#!/bin/bash
# This supports spaces in the path
STEAM_FOLDER="$HOME/.steam/steam/steamapps"
sed -i 's/\("AutoUpdateBehavior".*\)"0"/\1"1"/' "${STEAM_FOLDER}"/*.acf
