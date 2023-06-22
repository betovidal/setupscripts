#!/bin/sh

if [ $(id -u) != 0 ]; then
    echo "[ERR] Please run as root"
    exit 1
fi

print_usage() {
    me=`basename "$0"`
    echo "Usage:"
    echo "  $me SSID PASSWORD [HIDDEN]"
    echo "  or"
    echo "  $me -h | --help"
    echo "HIDDEN pass 1 if you're connecting to a hidden SSID, anything else or nothing otherwise"
    exit 1
}

ssid="$1"
password="$2"
hidden="$3"

if [ -z "$ssid" ] || [ -z "$password" ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "[ERR] Missing arguments."
    print_usage
fi

if [ "$hidden" = "1" ]; then
    sudo nmcli connection add type wifi con-name "$ssid" ssid "$ssid"
    sudo nmcli connection modify "$ssid" wifi-sec.key-mgmt wpa-psk
    sudo nmcli connection modify "$ssid" wifi-sec.psk "$password"
    sudo nmcli connection up "$ssid"
else
    # From https://askubuntu.com/a/930983
    sudo nmcli device wifi connect "$ssid" password "$password"
    sudo nmcli connection up "$ssid"
fi
