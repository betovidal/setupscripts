#!/usr/bin/env bash

BOOT_PATH=/boot
if mountpoint -q $BOOT_PATH; then
    sudo grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
else
    echo "Path $BOOT_PATH is not a mount point."
    echo "Make sure to mount the efi partition in /boot."
fi

# For debian, do:
# #sudo grub-install
# #sudo update-grub
