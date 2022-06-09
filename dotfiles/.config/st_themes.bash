#!/usr/bin/env bash

# All themes generated with https://terminal.sexy/
theme=""
default=(
	# Dark
	"black"
	"red3"
	"green3"
	"yellow3"
	"blue2"
	"magenta3"
	"cyan3"
	"gray90"
	# Bright
	"gray50"
	"red"
	"green"
	"yellow"
	"#5c5cff"
	"magenta"
	"cyan"
	"white"
)
# base16 -> tomorrow.dark
tomorrow=(
	# Dark
	"#1d1f21"
	"#cc6666"
	"#b5bd68"
	"#f0c674"
	"#81a2be"
	"#b294bb"
	"#8abeb7"
	"#c5c8c6"
	# Bright
	"#969896"
	"#cc6666"
	"#b5bd68"
	"#f0c674"
	"#81a2be"
	"#b294bb"
	"#8abeb7"
	"#ffffff"
)
# base16 -> monokai.dark
monokai=(
	# Dark
	"#272822"
	"#f92672"
	"#a6e22e"
	"#f4bf75"
	"#66d9ef"
	"#ae81ff"
	"#a1efe4"
	"#f8f8f2"
	# Bright
	"#75715e"
	"#f92672"
	"#a6e22e"
	"#f4bf75"
	"#66d9ef"
	"#ae81ff"
	"#a1efe4"
	"#f9f8f5"
)
function get_theme() {
	theme_name="$1"
	case $1 in
		tomorrow)
			theme=( "${tomorrow[@]}" )
			;;
		monokai)
			theme=( "${monokai[@]}" )
			;;
		*)
			theme=( "${default[@]}" )
			theme_name="default"
			;;
	esac
	echo "Using theme $theme_name"
}
