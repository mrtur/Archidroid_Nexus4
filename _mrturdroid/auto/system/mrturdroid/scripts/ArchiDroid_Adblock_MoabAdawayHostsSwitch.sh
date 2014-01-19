#!/system/bin/sh
# ArchiDroid Script

# Check if we're running as root
if [ `whoami 2>&1 | grep -i "root" | wc -l` -eq 0 ] && [ `whoami 2>&1 | grep -i "uid 0" | wc -l` -eq 0 ]; then
	echo "Sorry but you need to execute this script as root"
	exit 1
fi

ADDEV="/system/mrturdroid/dev"
sysrw

if [ -e $ADDEV/ADBLOCK_USE_ADAWAY_HOSTS ]; then
	rm -f /system/mrturdroid/etc/hosts
	ln -s /system/mrturdroid/etc/hosts_moab /system/mrturdroid/etc/hosts
	mv $ADDEV/ADBLOCK_USE_ADAWAY_HOSTS $ADDEV/ADBLOCK_USE_MOAB_HOSTS
	echo "Adblock now uses Mother-Of-Ad-Blocking hosts file, consuming about 25 megabytes of memory"
elif [ -e $ADDEV/ADBLOCK_USE_MOAB_HOSTS ]; then
	rm -f /system/mrturdroid/etc/hosts
	ln -s /system/mrturdroid/etc/hosts_adaway /system/mrturdroid/etc/hosts
	mv $ADDEV/ADBLOCK_USE_MOAB_HOSTS $ADDEV/ADBLOCK_USE_ADAWAY_HOSTS
	echo "Adblock now uses AdAway hosts file, consuming about 3 megabytes of memory"
else
	sysro
	echo "Could not find actual hosts status!"
	exit 1
fi

sysro
sh /system/etc/init.d/99ArchiDroid_Init "RELOAD" "ADBLOCK"
ndc resolver flushdefaultif >/dev/null # Flush DNS Cache
exit 0