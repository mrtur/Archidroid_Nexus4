#!/system/bin/sh

# Check if we're running as root
if [ -z `whoami | grep -i "root"` ] && [ -z `whoami | grep -i "uid 0"` ]; then
	echo "Sorry but you need to execute this script as root"
	exit 1
fi

if [ -z `which fstrim` ]; then
	echo "Sorry but it looks like you don't have required components. Are you using ArchiDroid?"
	exit 1
fi

fstrim -v /data
fstrim -v /cache
fstrim -v /preload
fstrim -v /system

echo "Fstrim() of /data /cache /preload /system done"
exit 0