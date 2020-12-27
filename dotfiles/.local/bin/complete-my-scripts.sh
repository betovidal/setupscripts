#!/bin/bash
RDC="rdc.sh"
WIFICONNECT="wificonnect.sh"
_file_completions() {
	# If there's already an argument after the command, do nothing
	local variant=$1
	local source_dir=""
	if [ "${#COMP_WORDS[@]}" != "2" ]; then
		return
	fi
	if [ "$variant" == "$RDC" ]; then
		source_dir=~/Remotes/*
	elif [ "$variant" == "$WIFICONNECT" ]; then
		source_dir=~/Networks/*.conf
	fi
	filenames=""
	is_first=1
	for fileroute in $source_dir; do
		filename=$(echo $fileroute | awk -F / '{ print $NF }')
		if [ $is_first != 1 ]; then
			filenames+=' '
		fi
		filenames+=$filename
		is_first=0
	done
	COMPREPLY=($(compgen -W "$filenames" "${COMP_WORDS[1]}"))
}
complete -F _file_completions "$RDC" "$RDC"
complete -F _file_completions "$WIFICONNECT" "$WIFICONNECT"
