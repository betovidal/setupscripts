#!/bin/env sh
# Set to nothing
INTERNAL_IP4_DNS=
# Then continue vpnc-script execution
# Arch specific.
if [ -f /etc/arch-release ]; then
    script_path=/etc/vpnc/vpnc-script
fi

# Debian specific.
if [ -f /etc/debian_version ]; then
    script_path=/usr/share/vpnc-scripts/vpnc-script
fi

$script_path
