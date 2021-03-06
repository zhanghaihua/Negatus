#!/bin/sh

if [ ! -f busybox-armv6l ]
then
    wget http://busybox.net/downloads/binaries/1.19.0/busybox-armv6l
fi
$ADB_PATH remount
$ADB_PATH push busybox-armv6l /system/bin/busybox

$ADB_PATH shell 'cd /system/bin; chmod 555 busybox; for x in `./busybox --list`; do ln -s ./busybox $x; done'
