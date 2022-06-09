#!/usr/bin/env bash

THEMES_PATH="$HOME/.config/st_themes.bash"
if [ -f "$THEMES_PATH" ]; then
	. "$THEMES_PATH"
fi
# theme var is defined in st_themes.bash
if [ -n "$theme" ]; then
	st \
		-f "Terminus:pixelsize=24:bold" \
		-C "${theme[0]}@0" \
		-C "${theme[1]}@1" \
		-C "${theme[2]}@2" \
		-C "${theme[3]}@3" \
		-C "${theme[4]}@4" \
		-C "${theme[5]}@5" \
		-C "${theme[6]}@6" \
		-C "${theme[7]}@7" \
		-C "${theme[8]}@8" \
		-C "${theme[9]}@9" \
		-C "${theme[10]}@10" \
		-C "${theme[11]}@11" \
		-C "${theme[12]}@12" \
		-C "${theme[13]}@13" \
		-C "${theme[14]}@14" \
		-C "${theme[15]}@15"
else
	st -f "Terminus:pixelsize=24:bold"
fi
