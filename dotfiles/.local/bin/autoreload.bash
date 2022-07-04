#!/usr/bin/env bash

# Should be run as sudo

if [ "$(id -u)" -ne 0 ]; then
    echo "Needs to be run as sudo."
    exit
fi

tool="$1"
wait_sec=2
path=""
notif_timeout=3000

case "$tool" in
    "nginx")
        path="/etc/nginx/"
        ;;
    *)
        echo "Tool not recognized."
        exit
        ;;
esac

# SUDO_USER is the user that's running this command as sudo.
userid=$(grep "$SUDO_USER" /etc/passwd | cut -f3 -d':')
alert() {
    echo "$1 - $2"
    sudo -u "$SUDO_USER" DISPLAY=:0 \
        DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$userid/bus" \
        notify-send -t $notif_timeout "$1" "$2"
}
initial_msg="Monitoring $tool @ $path for changes."
restart_msg="$tool is being restarted."
alert "Starting" "$initial_msg"
while true; do
    inotifywait -r -e modify,create,delete $path 2>&1
    # Wait for some seconds so if any other changes take place, this
    # event is not triggered multiple times
    sleep "$wait_sec"
    systemctl restart "$tool"
    alert "Restarting" "$restart_msg"
done
