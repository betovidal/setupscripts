#!/usr/bin/env bash

# More at https://www.gnu.org/software/bash/manual/html_node/Programmable-Completion-Builtins.html

# can $action $type $args

SCRIPT="do-backups"
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
        case "${COMP_WORDS[-2]}" in
            minecraft)
                minecraft_saves_path="$HOME/.minecraft/saves/"
                minecraft_saves=$(ls "$minecraft_saves_path" | tr '\n' ' ')
                COMPREPLY=($(compgen -W "$minecraft_saves" "${COMP_WORDS[-1]}"))
                ;;
            *)
                words="hola amigo :)"
                COMPREPLY=($(compgen -W "$words" "${COMP_WORDS[-1]}"))
                ;;
        esac
    fi
}

complete -F _do_backups_completions "$SCRIPT"
