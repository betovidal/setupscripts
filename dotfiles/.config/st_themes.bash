#!/usr/bin/env bash

# All themes generated with https://terminal.sexy/

unknown=(
	# Dark
	"#272822" # black
	"#f92672" # red
	"#a6e22e" # green
	"#f4bf75" # yellow
	"#66d9ef" # blue
	"#ae81ff" # magenta
	"#a1efe4" # cyan
	"#f8f8f2" # white
	# Bright
	"#75715e" # black
	"#f92672" # red
	"#a6e22e" # green
	"#f4bf75" # yellow
	"#66d9ef" # blue
	"#ae81ff" # magenta
	"#a1efe4" # cyan
	"#f9f8f5" # white
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

case $1 in
	tomorrow)
		theme=( "${tomorrow[@]}" )
		;;
	monokai)
		theme=( "${monokai[@]}" )
		;;
	*)
		theme=""
		;;
esac
