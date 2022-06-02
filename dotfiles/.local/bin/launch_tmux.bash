#!/usr/bin/env bash

if tmux ls &>/dev/null; then
	# There's tmux here
	first_tmux_session=$(tmux ls | cut -d ":" -f 1)
	tmux a -t "$first_tmux_session"
else
	# There isn't tmux here
	tmux
fi;
