#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

NC="\001$(tput sgr0)\002"
BLACK="\001$(tput setaf 0)\002"
RED="\001$(tput setaf 1)\002"
GREEN="\001$(tput setaf 2)\002"
YELLOW="\001$(tput setaf 3)\002"
BLUE="\001$(tput setaf 4)\002"
PURPLE="\001$(tput setaf 5)\002"
CYAN="\001$(tput setaf 6)\002"
WHITE="\001$(tput setaf 7)\002"
ACCENT=$PURPLE
alias ls="ls --color=auto"
alias bc="bc -l"
# PS1='[\u@\h \W]\$ '
PS1="$ACCENT[$WHITE\u$ACCENT@$WHITE\h \W$ACCENT]$WHITE\$ "
source $HOME/.local/bin/complete-my-scripts.sh