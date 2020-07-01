#!/bin/bash

_file_completions() {
	# If there's already an argument after the command, do nothing
	local variant=$1
	local source_dir=""
	if [ "${#COMP_WORDS[@]}" != "2" ]; then
		return
	fi
	if [ $variant == 'rdc' ]; then
		source_dir=~/Remotes/*
	elif [ $variant == 'wificonnect' ]; then
		source_dir=~/Networks/*.conf
	fi
	filenames=""
	is_first=1
	for fileroute in $source_dir; do
		if [ $variant == 'rdc' ]; then
			filename=$(echo $fileroute | awk -F / '{ print $NF }')
		elif [ $variant == 'wificonnect' ]; then
			filename=$(echo $fileroute | awk -F - '{ print $NF }' | awk -F . '{ print $1}')
		fi
		if [ $is_first != 1 ]; then
			filenames+=' '
		fi
		filenames+=$filename
		is_first=0
	done
	COMPREPLY=($(compgen -W "$filenames" "${COMP_WORDS[1]}"))
}
complete -F _file_completions "rdc" rdc
complete -F _file_completions "wificonnect" wificonnect
