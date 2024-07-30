#!/usr/bin/env bash

# More at https://www.gnu.org/software/bash/manual/html_node/Programmable-Completion-Builtins.html

# can $action $type $args

SCRIPT="mc-backups"
minecraft_saves_path="$HOME/.minecraft/saves/"
minecraft_saves=""
if [ -d "$minecraft_saves_path" ]; then
    minecraft_saves=$(ls "$minecraft_saves_path" | tr '\n' ' ')
fi
actions="backup restore"

_mc_backups_completions() {
    unset COMPREPLY
    # Only complete the second argument
    # Usernames
    if [ "${#COMP_WORDS[@]}" = "2" ]; then
        COMPREPLY=($(compgen -W "$actions" "${COMP_WORDS[-1]}"))
    elif [ "${#COMP_WORDS[@]}" = "3" ]; then
        COMPREPLY=($(compgen -W "$minecraft_saves" "${COMP_WORDS[-1]}"))
    fi
}

complete -F _mc_backups_completions "$SCRIPT"
