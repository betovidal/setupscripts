#!/bin/bash
if [ -z "$1" ]; then
	echo "Provide a network configuration file name."
	exit -1
fi
ROUTE=~/Networks/wlan0-$1.conf
if [ ! -f $ROUTE ]; then
	echo "Configuration file $ROUTE not found!"
	exit -2
fi
echo "Enter sudo credentials"
IFS= read -rs PASSWD
sudo -k
if sudo -lS &> /dev/null << EOF
$PASSWD
EOF
then
	sudo pkill wpa_supplicant
	sudo pkill dhclient
	sudo wpa_supplicant -B -i wlan0 -c $ROUTE
	sudo dhclient
else
    echo 'Wrong password.'
fi

