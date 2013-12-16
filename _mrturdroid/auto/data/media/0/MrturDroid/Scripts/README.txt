MrturDroid_FstrimData - From Android 4.3 I'm happy to include fstrim "on demand" to MrturDroid. By executing this script you call fstrim() on /data partition. If you want to learn more google "TRIM".

MrturDroid_FstrimAll - Same as above but also calls fstrim() on /cache /preload /system /efs in addition to /data. This is NOT recommended by me, as these partitions are RARELY being used in terms of writing but sometimes it may be useful to fstrim them as well.

# Please note that you SHOULD NOT fstrim too often. I'd say once per month is more than enough. I'd also advise to avoid other fstrim apps/scripts such as "LagFix", as my scripts do the same "on demand" and in natively way implemented directly in kernel.

MrturDroid_RemoveMrturDroid - Removes MrturDroid folder completely and reboots into recovery, allowing you to flash other ROM without any junk left by MrturDroid. Please don't use this script during updates and cleaning, as MrturDroid needs this folder.

MrturDroid_TemporaryUnroot - Performs temporary unrooting "on the fly". This allows opening/using some apps which require the device to be unrooted. Works only with poorly-designed apps.