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
# Replaced by my rr script and NetworkManager, respectively
# source $HOME/.local/bin/complete-my-scripts.sh

# NNN configuration

n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, either remove the "export" as in:
    #    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    #    (or, to a custom path: NNN_TMPFILE=/tmp/.lastd)
    # or, export NNN_TMPFILE after nnn invocation
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
