#!/system/bin/sh

if [ -n `mount | grep /system | grep ro` ]
then
    SYSRO=1
    mount -o rw,remount /system
else
    SYSRO=0
fi

cp -R ./system/* /system
chmod 755 /system/xbin/chrootinit
chmod 755 /system/etc/init.d/75chrootset

if [ $SYSRO -eq 1 ]
then
    mount -o ro,remount /system
fi
