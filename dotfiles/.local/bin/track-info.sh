#!/bin/bash

# Redirect stdout and stderr to INFO var
INFO=$(cmus-remote -Q 2>&1)
NOTRUNNING="cmus-remote: cmus is not running"
STOPPED="status stopped"
NOTFOUND="command not found"
TIME=1500
get_tag () {
       INFO="$1"
       TAG="$2"
       LINE=$(echo "$INFO" | grep "$TAG")
       VALUE=$(echo $LINE | sed -n "s/^$TAG//p")
       echo $VALUE
}
show_message() {
	notify-send -t "$TIME" "$1" "$2"
}
if [[ "$INFO" =~ "$NOTRUNNING" ]]; then
	show_message "Error" "cmus not running"
elif [[ "$INFO" =~ "$STOPPED" ]]; then
	show_message "Warning" "No track is playing"
elif [[ "$INFO" =~ "$NOTFOUND" ]]; then
	show_message "Error" "cmus not found"
else
	ARTISTTAG="tag artist "
	TITLETAG="tag title "
	ARTIST=$(get_tag "$INFO" "$ARTISTTAG")
	TITLE=$(get_tag "$INFO" "$TITLETAG")
	show_message "$ARTIST" "$TITLE"
fi
