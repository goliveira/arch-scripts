#!/bin/bash

#
# prepare_usb.sh
#

USBDRIVE="/dev/sdb"
dd bs=4M if=archlinux-x86_64.iso of=$USBDRIVE conv=fsync oflag=direct status=progress
