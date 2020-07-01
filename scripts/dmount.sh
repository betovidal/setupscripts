#!/bin/bash
# ask_for_permissions() {
# }
execute_command() {
	cmd=$1
	echo "Executing: \$$cmd"
	$cmd
}
do_mount() {
	for disk in "$@"; do
		ROUTE="/dev/$disk"
		if [ -a $ROUTE ]; then
			LABEL=$(ls -l /dev/disk/by-label | grep $disk | awk '{ print $9 }' )
			if [ -z $LABEL ]; then
				echo "Can't mount a disk without a label."
				continue
			fi
			FOLDER="/media/$USER/$LABEL"
			echo "Mounting : $ROUTE"
			echo "Label    : $LABEL"
			echo "User     : $USER"
			echo "Folder   : $FOLDER"
			if [ ! -d "$FOLDER" ]; then
				echo "Need to create directory."
				sudo mkdir "$FOLDER"
			else
				echo "Directory exists."
			fi
			if [[ $(findmnt -M "$FOLDER") ]]; then
				echo "Route is in use by another mount!"
			else
				sudo mount $ROUTE "$FOLDER"
			fi
		else
			echo "Can't find specified disk."
		fi
		echo "- - - - - - - - - -"
	done
}
ask_for_permissions() {
# !!!!!!! START OF INNER BLOCK (If I indent this, it breaks)
echo "Enter sudo credentials"
IFS= read -rs PASSWD
sudo -k
if sudo -lS &> /dev/null << EOF
$PASSWD
EOF
then
	echo "Permission granted"
	do_mount $@
else
	echo 'Wrong password.'
fi
# !!!!!!! END OF INNER BLOCK (If I indent this, it breaks)
}
if [ -z "$1" ]; then
	execute_command "lsblk -o NAME,LABEL,MOUNTPOINT"
	exit 1
fi
if sudo -n true; then
	# echo "You have permissions"
	do_mount $@
else
	ask_for_permissions $@
fi
