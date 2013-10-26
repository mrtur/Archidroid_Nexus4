#!/sbin/sh

AD="/data/media/0/ArchiDroid"

if [ ! -d /data/media/0 ]; then
	if [ -f /data/media/0 ]; then
		rm -f /data/media/0
	fi
	cd /data/media
	FILES=`ls`
	mkdir -p /data/media/0
	
	for i in $FILES; do
		mv "$i" 0/
	done
fi

if [ ! -d $AD ]; then
	mkdir -p $AD
fi

rm -f $AD/INSTALL
rm -f $AD/UPDATE
rm -f $AD/FORCE

# Force EFS Backup
#if [ ! -d $AD/Backups ]; then
#	mkdir -p $AD/Backups
#fi

#if [ -e $AD/Backups/efs_OLD.tar.gz ]; then
#	rm -f $AD/Backups/efs_OLD.tar.gz
#fi
#if [ -e $AD/Backups/efs.tar.gz ]; then
#	mv $AD/Backups/efs.tar.gz $AD/Backups/efs_OLD.tar.gz
#fi
#mount /dev/block/mmcblk0p3 /efs
#busybox tar zcvf $AD/Backups/efs.tar.gz /efs
#umount /efs

#DATE1=`stat $AD/Backups/efs.tar.gz | tail -n 2 | head -n 1`
#echo "efs.tar.gz $DATE1" >  $AD/Backups/efs.txt
#if [ -e $AD/Backups/efs_OLD.tar.gz ]; then
#	DATE2=`stat $AD/Backups/efs_OLD.tar.gz | tail -n 2 | head -n 1`
#	echo "efs_OLD.tar.gz $DATE2" >>  $AD/Backups/efs.txt
#fi
#echo "
#ArchiDroid performed a backup of your /efs partition just in case. Here you can find two most recent backups with dates above.
#Backups are stored in compressed tar (gzip) format. They include directory structure so should be extracted to the root / of the filesystem #instead of /efs.
#Permissions of the files are stored as well so you don't need to fix them manualy.

#If you need to restore such backup please use ArchiDroid_RestoreEFS.sh script. Alternatively you can use command like
#busybox tar -zxvf $AD/Backups/efs.tar.gz -C /
#Running from root of course.

#If you have no idea how to use above command please stick with a script provided by me. Eventually you can also extract .tar archive from .tar.gz #backup (7-zip works fine) and use any third-party app, f.e. efs professional or anything else able to restore from .tar format (nearly everything #I guess).
#And don't forget to hit thanks if this backup saved your ass ;)" >> $AD/Backups/efs.txt

exit 0
