#!/bin/sh

# From https://askubuntu.com/a/930983

if [ $(id -u) != 0 ]; then
    echo "[ERR] Please run as root"
    exit 1
fi

print_usage() {
    me=`basename "$0"`
    echo "Usage:"
    echo "  $me SSID PASSWORD"
    exit 1
}

ssid="$1"
password="$2"

if [ -z "$ssid" ] || [ -z "$password" ]; then
    echo "[ERR] Missing arguments."
    print_usage
fi

# This is it
sudo nmcli wifi connect "$ssid" password "$password"
sudo nmcli connection up "$ssid"
