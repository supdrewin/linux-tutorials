#!/usr/bin/env bash

#
# This script is written by Supdrewin
# Mon Apr 4 08:07:50 AM UTC 2022
#

EXIT_FAILURE=1

((UID == 0)) || {
        command -v sudo >/dev/null || {
                echo "must be superuser"
                exit $EXIT_FAILURE
        }
}

[[ $ROOTFS ]] || {
        echo "ROOTFS not set"
        exit $EXIT_FAILURE
}

sudo -E bash -c "$(sed -n 25,31p "$0")"
exit $?

mount "$ROOTFS" "$ROOTFS" --bind &&
        mount /dev "$ROOTFS/dev" --bind &&
        mount /proc "$ROOTFS/proc" --bind &&
        mount /sys "$ROOTFS/sys" --bind &&
        chroot "$ROOTFS"

umount -R "$ROOTFS"
