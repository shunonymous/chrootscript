#!/bin/sh

adb root

adb remount

sleep 2

adb push ./system /system
adb shell chmod 755 /system/xbin/chrootinit
adb shell chmod 755 /system/etc/init.d/75chrootset

echo "Android system will reboot 10 seconds later."
echo "Cancel:Ctrl+c"

sleep 10
adb reboot
