#!/usr/bin/env bash

THEMES_PATH="$HOME/.config/st_themes.bash"
THEME_PATH="$HOME/.config/st_theme.bash"
if [ -f "$THEMES_PATH" ]; then
	. "$THEMES_PATH"
fi
if [ -f "$THEME_PATH" ]; then
	# theme_name is defined here. Else, load default theme.
	. "$THEME_PATH"
else
	# These two variables are expected to exist in the file $THEME_PATH
	theme_name="default"
	font_size="24"
fi
# Assign global var theme in this function
# so I don't have to figure out how to
# return an array from a function.
get_theme "$theme_name"
# theme var is defined in st_themes.bash
if [ -n "$theme" ]; then
	st \
		-f "Terminus:pixelsize=${font_size}:bold" \
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
		-C "${theme[15]}@15" \
		"$@"
else
	st -f "Terminus:pixelsize=${font_size}:bold" "$@"
fi
