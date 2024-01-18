#!/usr/bin/env bash

# More at https://www.gnu.org/software/bash/manual/html_node/Programmable-Completion-Builtins.html

# can $action $type $args

SCRIPT="do-backups"
minecraft_saves="$HOME/.minecraft/saves/"
_do_backups_completions() {
    unset COMPREPLY
    # Only complete the second argument
    # Usernames
    if [ "${#COMP_WORDS[@]}" = "2" ]; then
        actions="backup restore"
        COMPREPLY=($(compgen -W "$actions" "${COMP_WORDS[-1]}"))
    elif [ "${#COMP_WORDS[@]}" = "3" ]; then
        backup_types="minecraft wordpress bookstack"
        COMPREPLY=($(compgen -W "$backup_types" "${COMP_WORDS[-1]}"))
    elif [ "${#COMP_WORDS[@]}" = "4" ]; then
        if [ "${COMP_WORDS[-2]}" == "minecraft" ]; then
            minecraft_saves="hello there friend"
            COMPREPLY=($(compgen -W "$minecraft_saves" "${COMP_WORDS[-1]}"))
        fi
    fi
}
#        -o default after no more matches are present, use the default
#        completion function.
complete -o default -F _do_backups_completions "$SCRIPT"
