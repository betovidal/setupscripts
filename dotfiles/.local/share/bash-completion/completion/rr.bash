#!/usr/bin/env bash

SCRIPT="rr"
# TYPES="rdp ssh"
TYPES="rdp ssh"
_remote_connections_completions() {
	unset COMPREPLY
	# If there's already an argument after the command, do nothing
	if [ "${#COMP_WORDS[@]}" = "2" ]; then
		words="$TYPES"
	elif [ "${#COMP_WORDS[@]}" = "3" ]; then
		TYPE="${COMP_WORDS[1]}"
		if [ "$TYPE" != "rdp" ] && [ "$TYPE" != "ssh" ]; then
			return
		fi
		# Depending on the type (previous word)
		# Do not include hosts that cotains rdp/ssh in "ignore" array
		words=$(jq -r --arg TYPE "$TYPE" '[.hosts[] | select(.ignore | index($TYPE) | not)] | map(.name) | join(" ")' "$HOME/.config/remotes.json")
	else
		return
	fi
	COMPREPLY=($(compgen -W "$words" "${COMP_WORDS[-1]}"))
}
complete -F _remote_connections_completions "$SCRIPT"
