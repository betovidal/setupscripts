#!/bin/bash

# Function to represent a range from 0 to 100 as boxes
declare -a BOXES=(" " "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")
function graph_perc_as_box() {
	VAL=$1
	INT_VAL=$(printf "%.0f" "$VAL")
	if [[ "$INT_VAL" -lt "1" ]]; then
		INDEX="0"
	elif [[ "$INT_VAL" -gt "100" ]]; then
		INDEX="8"
	else
		INDEX=$(expr 1 + $INT_VAL / 14)
		if [[ "$INDEX" -gt "7" ]]; then
			INDEX="7"
		fi
	fi
	printf "${BOXES[$INDEX]}"
}
# Value to represent bytes as human readable
function bytes_to_human() {
	awk -v bytes=$1 '
		BEGIN {
			prefix[0] = "B "
			prefix[1] = "Ki"
			prefix[2] = "Mi"
			prefix[3] = "Gi"
			prefix[4] = "Ti"
			scaled = bytes
			base = 1024
			for (i = 0; i < 5 && scaled >= base; i++) {
					scaled /= base
			}
			str_out = sprintf("%.1f %s", scaled, prefix[i])
			printf "%9s", str_out
		}
	'
}
