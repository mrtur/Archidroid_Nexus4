#!/sbin/sh

# MrturDroid Backend Fallback
mv /system/bin/debuggerd /system/xbin/debuggerd
mv /system/bin/addebuggerd /system/bin/debuggerd

# SuperSU
#mkdir /system/bin/.ext
#cp /system/xbin/su /system/xbin/daemonsu
#cp /system/xbin/su /system/bin/.ext/.su

sync
exit 0