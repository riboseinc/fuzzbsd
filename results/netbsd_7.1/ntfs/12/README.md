```
[*] Tue Aug  8 15:03:35 UTC 2017 confdisk 'vnd0' 'image-fuzzbsd-ntfs-12.005'
[*] Tue Aug  8 15:03:35 UTC 2017 mount 'image-fuzzbsd-ntfs-12.005' '/dev/vnd0'
panic: buf mem pool index 55
cpu0: begin traceback...
vpanic() at netbsd:vpanic+0x13c
snprintf() at netbsd:snprintf
bufpool_page_free() at netbsd:bufpool_page_free
allocbuf() at netbsd:allocbuf+0x21
getblk() at netbsd:getblk+0xfc
bio_doread.isra.4() at netbsd:bio_doread.isra.4+0x19
bread() at netbsd:bread+0x1a
ntfs_loadntnode() at netbsd:ntfs_loadntnode+0x78
ntfs_vgetex() at netbsd:ntfs_vgetex+0x137
ntfs_vget() at netbsd:ntfs_vget+0x21
ntfs_mountfs() at netbsd:ntfs_mountfs+0x2a9
ntfs_mount() at netbsd:ntfs_mount+0x1dc
VFS_MOUNT() at netbsd:VFS_MOUNT+0x34
mount_domount() at netbsd:mount_domount+0x122
do_sys_mount() at netbsd:do_sys_mount+0x2dd
sys___mount50() at netbsd:sys___mount50+0x33
syscall() at netbsdf:syscall+0x9a
--- syscall (number 410) ---
7f7ff7088caa:
cpu0: End traceback...

dumping to dev 0,1 (offset=1464, size=262031):
dump 87 86 85
```

![alt](https://github.com/riboseinc/fuzzbsd/blob/master/results/netbsd_7.1/ntfs/12/netbsd_7.1-image-fuzzbsd-ntfs-12.005.png "netbsd_7.1")
