#!/bin/bash
function printMsg {
	char="="
	nchars=${#1}
	printf "$1\n"
	for ((i=0; i < "$nchars"; i++)); do
		printf "$char"
	done
	printf "\n\n"
}
function printHelp {
	echo "Usage: $0 [OPTION]"
	echo "OPTION"
	echo "  h  Show this help."
	echo "  i  Install files. Ask before overwriting."
	echo "     Do not uncompress firefox."
	echo "  f  Do not ask to overwrite copied files."
	echo "     Uncompress firefox."
	echo ""
}
if [ "$1" == "h" ] || [ "$1" == "" ]; then
	printHelp
	exit 1
elif [ "$1" != "i" ] && [ "$1" != "f" ]; then
	echo "Option '$1' not recognized"
	exit 1
fi
# Create folder structures for vim, Dev, DL, Pic/cap
printMsg "Creating folders"
source createfolders.sh
# Most important: gcc, git, curl...
printMsg "Getting apt packages"
source getpackages.sh
# Get suckless tools repos and my own (instructions for vim)
printMsg "Getting git repos"
source getrepos.sh
# With ff I can register a new ssh
printMsg "Getting Firefox"
source getff.sh
# After repos are available, I can install vim
printMsg "Installing Vim"
source setupvim.sh
# After repos are available, I can configure mpd
printMsg "Configuring mpd"
source mpdconfig.sh
# Backup and remove original bash profile and rc, will be linked by link.sh
printMsg "Backing up bash_profile and bashrc, deleting originals"
source bashops.sh
# ls with colors
printMsg "Adding aliases"
source addaliases.sh
# User specific configurations and binaries (scripts)
printMsg "Linking home configurations and scripts"
source link.sh
