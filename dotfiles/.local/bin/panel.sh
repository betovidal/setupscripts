#!/bin/bash

#TODO
# Network check connectivity https://git.sr.ht/~rycwo/lemons/tree/master/item/lemons
#                         or https://stackoverflow.com/questions/929368/how-to-test-an-internet-connection-with-bash
# Wireless (with strength)
# Battery
# Memory
# Cpu_usage

# Important notes
# -source vs dot (.), . is POSIX
# -The $! at the end of the echo prints their process ID, for debug purposes


# imports
HERE=$(dirname ${BASH_SOURCE[0]})
. "$HERE/helpers/valrepr.sh"


VPNC_PID_FILE=/var/run/vpnc.pid
NET_IFACE="enp4s0"
PANEL_FIFO=/tmp/panel-fifo
PANEL_HEIGHT=24
PANEL_FONT="-*-terminus-*-*-*-*-22-*-*-*-*-*-*-*"
PANEL_WM_NAME=lemon_panel
TITLE_WIDTH=30

COLOR_DEFAULT_FG="#a7a5a5"
COLOR_DEFAULT_BG="#333232"
COLOR_MONITOR_FG="#8dbcdf"
COLOR_MONITOR_BG="#333232"
COLOR_FOCUSED_MONITOR_FG="#b1d0e8"
COLOR_FOCUSED_MONITOR_BG="#144b6c"
COLOR_FREE_FG="#737171"
COLOR_FREE_BG="#333232"
COLOR_FOCUSED_FREE_FG="#000000"
COLOR_FOCUSED_FREE_BG="#504e4e"
COLOR_OCCUPIED_FG="#a7a5a5"
COLOR_OCCUPIED_BG="#333232"
COLOR_FOCUSED_OCCUPIED_FG="#d6d3d2"
COLOR_FOCUSED_OCCUPIED_BG="#504e4e"
COLOR_URGENT_FG="#f15d66"
COLOR_URGENT_BG="#333232"
COLOR_FOCUSED_URGENT_FG="#501d1f"
COLOR_FOCUSED_URGENT_BG="#d5443e"
COLOR_STATE_FG="#89b09c"
COLOR_STATE_BG="#333232"
COLOR_TITLE_FG="#a8a2c0"
COLOR_TITLE_BG="#333232"
COLOR_SYS_FG="#b1a57d"
COLOR_SYS_BG="#333232"
COLOR_VOLUME_FG="#DDBBDD"
COLOR_VOLUME_MUTED_FG="#555555"
COLOR_VOLUME_BG="#333232"
COLOR_IP_UP_FG="#89b09c"
COLOR_IP_DOWN_FG="#d5443e"
COLOR_IP_BG="#333232"
COLOR_VPN_FG="#BBDDBB"
COLOR_VPN_DOWN_FG="#555555"
COLOR_VPN_BG="#333232"
COLOR_RAM_FG="#DDBBDD"
COLOR_RAM_BG="#333232"

if xdo id -a "$PANEL_WM_NAME" > /dev/null ; then
	printf "%s\n" "The panel is already running." >&2
	exit 1
fi

trap 'trap - TERM; kill 0' INT TERM QUIT EXIT

[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"


# Here are the subprograms that add information to the status FIFO which are
# interpreted by panel_bar, below. Each output is detected by its first
# character, which is how the bspwm internal information is presented.

# [T]Title of windows
xtitle -sf 'T%s\n' -t 30 > "$PANEL_FIFO" & echo "xtitle $!"
# [S]Calendar
function get_calendar() {
	while true; do
		date '+S%a, %d %b %H:%M:%S'
		sleep 1
	done
}
get_calendar > "$PANEL_FIFO" & echo "get_calendar $!"
# [N]Network
function get_network_status() {
	# [[:space:]] will remove line break too
	echo $(ip address show $NET_IFACE | head -n 1 | grep -o " UP \| DOWN " | tr -d " ")
}
function get_network_ip() {
	while true; do
		NET_IP=$(ip address show $NET_IFACE | grep "inet " | awk '{ print $2 }' | sed 's/\/[0-9]\+//g')
		if [[ $NET_IP == "" ]]; then
			NET_IP=$NET_IFACE
		fi
		echo "N$NET_IP"
		sleep 5
	done
}
get_network_ip > "$PANEL_FIFO" & echo "get_network_ip $!"
# [W]WM information
bspc subscribe report > "$PANEL_FIFO" & echo "bscp subscribe $!"
# [P]Playback volume
function get_playback_volume_bar() {
	VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{ print $5 }' | tr -d "%\n")
	VOL_BAR=$(graph_perc_as_box "$VOL")
	echo "P♫ $VOL_BAR"
}
function get_playback_volume_mute() {
	VOL_MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ | sed 's/Mute: //g' | tr -d "\n")
	printf "$VOL_MUTE"
}
function playback_volume_handler() {
	while read -r line; do
		if [[ "$line" =~ ^Event\ \'change\'\ on\ sink\ \#[[:digit:]]+$ ]]; then
			get_playback_volume_bar
		fi
	done
}
# Query once to initialize
get_playback_volume_bar > "$PANEL_FIFO" & echo "get_playback_volume_bar $!"
pactl subscribe | playback_volume_handler > "$PANEL_FIFO" & echo "playback_volume_handler $!"

# [V]VPN state
VPN_DIRNAME=$(dirname $VPNC_PID_FILE)
VPN_FILENAME=$(basename $VPNC_PID_FILE)
function vpn_handler () {
	while read -r _dir _event _file; do
		# /var/run CREATE vpnc.pid
		if [[ "$_file" == "vpnc.pid" ]]; then
			echo "V$_event"
		fi
	done
}
# Before wait is in place, check if file exists
if [[ -f "$VPNC_PID_FILE" ]]; then
	echo "VCREATE" > "$PANEL_FIFO" &
else
	echo "VDELETE" > "$PANEL_FIFO" &
fi
inotifywait -m -e create,delete $VPN_DIRNAME | vpn_handler > "$PANEL_FIFO" & echo "vpn_handler $!"

# [U]Transfer upload rates
# [D]Transfer download rates
function get_network_delta() {
	# Direction = $1, either tx or rx
	# First iteration both are the same
	src="/sys/class/net/$NET_IFACE/statistics/$1_bytes"
	now=$(cat "$src")
	before="$now"
	direction="D" # Or U for upload
	symbol="▼"
	if [[ $1 == "tx" ]]; then
		direction="U"
		symbol="▲"
	fi

	while true; do
		now=$(cat "$src")
		delta=$(expr $now - $before)
		before="$now"
		echo "${direction}${symbol}$(bytes_to_human $delta)"
		sleep 1
	done
}
get_network_delta "tx" > "$PANEL_FIFO" & echo "get_network_delta tx $!"
get_network_delta "rx" > "$PANEL_FIFO" & echo "get_network_delta rx $!"

# [R]am, non available
function get_mem_detail() {
	mem_info=$1
	mem_component=$2
	echo $(echo "$mem_info" | grep "$mem_component" | awk '{ print $2; }')
}

function get_used_ram() {
	mem_info=$(cat /proc/meminfo)
	# in kB
	mem_total=$(get_mem_detail "$mem_info" "MemTotal")
	mem_available=$(get_mem_detail "$mem_info" "MemAvailable")
	mem_non_available=$(( $mem_total - $mem_available ))
	# Make readable. Non available or used.
	echo "$(bytes_to_human $(( $mem_non_available * 1024 )))"
}
function poll_ram() {
	while true; do
		echo "R$(get_used_ram)"
		sleep 1
	done
}
poll_ram > "$PANEL_FIFO" & echo "get_used_ram $!"

# Here, information is formatted and appended accordingly before piping to
# lemonbar
# T - xtitle output
# S - date output (same as example)
# W - window manager information (free/focused/occupied desktops)

num_mon=$(bspc query -M | wc -l)
function panel_bar() {
	while read -r line ; do
		case $line in
			S*)
				# clock output
				sys="%{F$COLOR_SYS_FG}%{B$COLOR_SYS_BG} ${line#?} %{B-}%{F-}"
				# Clickable
				# sys="%{F$COLOR_SYS_FG}%{B$COLOR_SYS_BG}%{A:gsimplecal:} ${line#?} %{A}%{B-}%{F-}"
				;;
			T*)
				# xtitle output
				title="%{F$COLOR_TITLE_FG}%{B$COLOR_TITLE_BG} ${line#?} %{B-}%{F-}"
				;;
			P*)
				vol_fg_color="$COLOR_VOLUME_FG"
				if [[ $(get_playback_volume_mute) == "yes" ]]; then
					vol_fg_color="$COLOR_VOLUME_MUTED_FG"
				fi
				vol="%{F$vol_fg_color}%{B$COLOR_VOLUME_BG} ${line#?}${B-}%{B-}%{F-}"
				;;
			N*)
				ip_fg_color="$COLOR_IP_UP_FG"
				if [[ $(get_network_status) == "DOWN" ]]; then
					ip_fg_color="$COLOR_IP_DOWN_FG"
				fi
				net="%{F$ip_fg_color}%{B$COLOR_IP_BG} ${line#?} ${B-} %{B-}%{F-}"
				;;
			V*)
				# COLOR_VPN_FG="#BBDDBB"
				# COLOR_VPN_DOWN_FG="#335533"
				# COLOR_VPN_BG="#333232"
				VPNMSG="VPN"
				vpn_fg_color="$COLOR_VPN_DOWN_FG"
				if [[ "${line#?}" == "CREATE" ]]; then
					vpn_fg_color="$COLOR_VPN_FG"
				fi
				vpnstat="%{F$vpn_fg_color}%{B$COLOR_VPN_BG}${VPNMSG}${B-} %{B-}%{F-}"
				;;
			[UD]*)
				case $line in
					U*)
						uprate="%{F$COLOR_SYS_FG}%{B$COLOR_SYS_BG}${line#?}%{B-}%{F-}"
						;;
					D*)
						downrate="%{F$COLOR_SYS_FG}%{B$COLOR_SYS_BG}${line#?}%{B-}%{F-}"
						;;
				esac
				;;
			R*)
				ram="%{F$COLOR_RAM_FG}%{B$COLOR_RAM_BG}R:${line#?} %{B-}%{F-}"
				;;
			W*)
				# bspwm's state
				wm=
				IFS=':'
				set -- ${line#?}
				while [ $# -gt 0 ] ; do
					item=$1
					name=${item#?}
					case $item in
						[mM]*)
							case $item in
								m*)
									# monitor
									FG=$COLOR_MONITOR_FG
									BG=$COLOR_MONITOR_BG
									on_focused_monitor=
									;;
								M*)
									# focused monitor
									FG=$COLOR_FOCUSED_MONITOR_FG
									BG=$COLOR_FOCUSED_MONITOR_BG
									on_focused_monitor=1
									;;
							esac
							[ $num_mon -lt 2 ] && shift && continue
							wm="${wm}%{F${FG}}%{B${BG}}%{A:bspc monitor -f ${name}:} ${name} %{A}%{B-}%{F-}"
							;;
						[fFoOuU]*)
							case $item in
								f*)
									# free desktop
									FG=$COLOR_FREE_FG
									BG=$COLOR_FREE_BG
									UL=$BG
									;;
								F*)
									if [ "$on_focused_monitor" ] ; then
										# focused free desktop
										FG=$COLOR_FOCUSED_FREE_FG
										BG=$COLOR_FOCUSED_FREE_BG
										UL=$BG
									else
										# active free desktop
										FG=$COLOR_FREE_FG
										BG=$COLOR_FREE_BG
										UL=$COLOR_FOCUSED_FREE_BG
									fi
									;;
								o*)
									# occupied desktop
									FG=$COLOR_OCCUPIED_FG
									BG=$COLOR_OCCUPIED_BG
									UL=$BG
									;;
								O*)
									if [ "$on_focused_monitor" ] ; then
										# focused occupied desktop
										FG=$COLOR_FOCUSED_OCCUPIED_FG
										BG=$COLOR_FOCUSED_OCCUPIED_BG
										UL=$BG
									else
										# active occupied desktop
										FG=$COLOR_OCCUPIED_FG
										BG=$COLOR_OCCUPIED_BG
										UL=$COLOR_FOCUSED_OCCUPIED_BG
									fi
									;;
								u*)
									# urgent desktop
									FG=$COLOR_URGENT_FG
									BG=$COLOR_URGENT_BG
									UL=$BG
									;;
								U*)
									if [ "$on_focused_monitor" ] ; then
										# focused urgent desktop
										FG=$COLOR_FOCUSED_URGENT_FG
										BG=$COLOR_FOCUSED_URGENT_BG
										UL=$BG
									else
										# active urgent desktop
										FG=$COLOR_URGENT_FG
										BG=$COLOR_URGENT_BG
										UL=$COLOR_FOCUSED_URGENT_BG
									fi
									;;
							esac
							wm="${wm}%{F${FG}}%{B${BG}}%{U${UL}}%{+u}%{A:bspc desktop -f ${name}:} ${name} %{A}%{B-}%{F-}%{-u}"
							;;
						[LTG]*)
							# layout, state and flags
							wm="${wm}%{F$COLOR_STATE_FG}%{B$COLOR_STATE_BG} ${name} %{B-}%{F-}"
							;;
					esac
					shift
				done
				;;
		esac
		printf "%s\n" "%{l}${wm}${title}%{r}${vpnstat}${net}${ram}${uprate}${downrate}${vol}${sys}"
		# printf "%s\n" "%{l}${wm}%{c}${title}%{r}${sys}"
	done
}

panel_bar < "$PANEL_FIFO" | lemonbar -a 32 -u 2 -n "$PANEL_WM_NAME" -g x$PANEL_HEIGHT -f "$PANEL_FONT" -F "$COLOR_DEFAULT_FG" -B "$COLOR_DEFAULT_BG" | sh & echo "panel_bar $!"
# cat "$PANEL_FIFO"

wid=$(xdo id -m -a "$PANEL_WM_NAME")
xdo above -t "$(xdo id -N Bspwm -n root | sort | head -n 1)" "$wid"

wait
