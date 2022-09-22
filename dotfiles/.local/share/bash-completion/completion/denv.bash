#!/usr/bin/env bash

SCRIPT="denv"
_denv_completions() {
    unset COMPREPLY
    # Only complete the second argument
    if [ "${#COMP_WORDS[@]}" = "2" ]; then
        words="$(denv la)"
    elif [ "${#COMP_WORDS[@]}" = "3" ]; then
        words="$(denv lc)"
    else
        return
    fi
    COMPREPLY=($(compgen -W "$words" "${COMP_WORDS[-1]}"))
}
complete -F _denv_completions "$SCRIPT"
