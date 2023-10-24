#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Colors definition
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
# PS1='[\u@\h \W]\$ '
PS1="$ACCENT[$WHITE\u$ACCENT@$WHITE\H \W$ACCENT]$WHITE\$ "
# Replaced by my rr script and NetworkManager, respectively
# source $HOME/.local/bin/complete-my-scripts.sh

# FZF
# Either multiple -g flags or as single one as -g '!{.git,.svn,.hg}'
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git" -g "!__pycache__" '

# Include utility functions for the terminal
FUNCTIONS_SCRIPT="$HOME/.local/bin/helpers/functions.sh"
if [ -x "$FUNCTIONS_SCRIPT" ]; then
	. "$FUNCTIONS_SCRIPT"
fi

# Include aliases the Debian way.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Needed in Debian
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Bash configurations
HISTCONTROL=ignoreboth
