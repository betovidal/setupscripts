#!/usr/bin/env bash

SCRIPT="vv"
CONF_PATH="$HOME/.config/vpnconf"
# TYPES="rdp ssh"
_vpnc_completions() {
    unset COMPREPLY
    # Only complete the second argument
    if [ "${#COMP_WORDS[@]}" = "2" ]; then
        words=""
        for fullfile in ${CONF_PATH}/*.conf; do
            filename=$(basename -- "$fullfile")
            filename="${filename%.*}"
            words="${words} $filename"
        done
    else
        return
    fi
    COMPREPLY=($(compgen -W "$words" "${COMP_WORDS[-1]}"))
}
complete -F _vpnc_completions "$SCRIPT"
