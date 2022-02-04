#!/bin/env bash
# Should be run with sudo
USERFOLDER="$USER"
if [ "$USERFOLDER" == "root" ]; then
	USERFOLDER="$SUDO_USER"
fi
do_mount() {
	for disk in "$@"; do
		ROUTE="/dev/$disk"
		if [ -b $ROUTE ]; then
			LABEL=$(ls -l /dev/disk/by-label | grep $disk | awk '{ print $9 }' )
			if [ -z $LABEL ]; then
				echo "Can't mount a disk without a label."
				continue
			fi
			MOUNTPOINT="/media/$USERFOLDER/$LABEL"
			if [ ! -d "$MOUNTPOINT" ]; then
				mkdir -p "$MOUNTPOINT"
			fi
			if [[ $(findmnt -M "$MOUNTPOINT") ]]; then
				echo "Route is in use by another mount. Can't mount $disk"
			else
				echo "Mounted $disk in $MOUNTPOINT"
				mount "$ROUTE" "$MOUNTPOINT"
			fi
		else
			echo "Can't find specified disk: $disk"
		fi
		echo "- - - - - - - - - -"
	done
}
if [ -z "$1" ]; then
	lsblk -o +LABEL,FSTYPE
	exit 1
else
	do_mount $@
fi
