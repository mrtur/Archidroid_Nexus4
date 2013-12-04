#!/system/bin/sh

# Check if we're running as root
if [ `whoami` != "root" ]; then
	echo "Sorry but you need to execute this script as root"
	exit 1
fi

if [ -z `which sysrw` ] || [ -z `which sysro` ]; then
	echo "Sorry but it looks like you don't have required components. Are you using MrturDroid?"
	exit 1
fi

sysrw
cd /system/etc/init.d
for FILE in `find . -name "*MrturDroid*"` ; do
	rm -f $FILE
done
sysro
rm -rf /data/media/0/MrturDroid
reboot recovery
exit 0