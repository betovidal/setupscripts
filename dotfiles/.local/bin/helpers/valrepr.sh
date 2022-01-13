#!/bin/bash

# Function to represent a range from 0 to 100 as boxes
declare -a BOXES=(" " "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")

BOXES_LENGTH=${#BOXES[@]}
STEP=$(( 100 / ($BOXES_LENGTH - 2) ))
function graph_perc_as_box() {
	VAL=$1
	INT_VAL=$(printf "%.0f" "$VAL")
	if [[ "$INT_VAL" -lt "1" ]]; then
		INDEX="0"
	else
		INDEX=$(( 1 + $INT_VAL / $STEP ))
		if [[ "$INDEX" -gt "$(( $BOXES_LENGTH - 2 ))" ]]; then
			INDEX=$(( $BOXES_LENGTH - 1 ))
		fi
	fi
	printf "${BOXES[$INDEX]}"
	# printf "INDEX = $INDEX, Box = ${BOXES[$INDEX]}\n"
}
function test_graph() {
	for (( i=0; i<=105; i+=5 )); do
		graph_perc_as_box $i
	done
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

