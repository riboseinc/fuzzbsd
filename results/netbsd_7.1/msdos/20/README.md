```
[*] Tue Aug  8 14:05:05 UTC 2017 mount 'image-fuzzbsd-msdos-20.012' '/dev/vnd0'
panic: buf mem pool index 55
cpu0: Begin traceback...
vpanic() at netbsd:vpanic+0x13c
snprintf() at netbsd:snprintf
bufpool_page_free() at netbsd:bufpool_page_free
allocbuf() at netbsd:allocbuf+0x21
getblk() at netbsd:getblk+0xfc
bio_doread.isra.4() at netbsd:bio_doread.isra.4+0x19
bread() at netbsd:bread+0x1a
fillinusemap() at netbsd:fillinusemap+0x176
msdosfs_mountfs() at netbsd:msdosfs_mountfs+0x516
msdosfs_mount() at netbsd:msdosfs_mount+0x2f0
VFS_MOUNT() at netbsd:VFS_MOUNT+0x34
mount_domount() at netbsd:mount_domount+0x122
do_sys_mount() at netbsd:do_sys_mount+0x2dd
sys___mount50() at netbsd:sys___mount50+0x33
syscall() at netbsd:syscall+0x9a
--- syscall (number 410) ---
7f7ff7083caa:
cpu0: End traceback...

dumping to dev 0,1 (offset=1464, size=262031):
dump 88 87 86 85 84 83 82 81 80
```

![alt](https://github.com/riboseinc/fuzzbsd/blob/master/results/netbsd_7.1/msdos/20/netbsd_7.1-image-fuzzbsd-msdos-20.012.png "netbsd_7.1")