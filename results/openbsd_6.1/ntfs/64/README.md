```
[*] Wed Aug  9 07:20:29 HKT 2017 confdisk 'vnd0' 'image-fuzzbsd-ntfs-64.000'
[*] Wed Aug  9 07:20:29 HKT 2017 mount 'image-fuzzbsd-ntfs-64.000' '/dev/vnd0'
panic: Non dma reachable buffer passed to VOP_STRATEGY
Stopped at      Debugger+0x9:   leave
    TID    PID    UID     PRFLAGS     PFLAGS  CPU  COMMAND
*234912  24484      0         0x3          0    0  mount_ntfs
Debugger() at Debugger+0x9
panic() at panic+0xfe
VOP_STRATEGY() at VOP_STRATEGY+0x70
bio_doread() at bio_doread+0xbc
bread() at bread+x013
ntfs_loadntnode() at ntfs_loadntnode+0x268
ntfs_vgetex() at ntfs_vgetex+0x138
ntfs_vget() at ntfs_vget+0x37
ntfs_mountfs() at ntfs_mountfs+0x350
ntfs_mount() at ntfs_mount+0x21c
sys_mount() at sys_mount+0x271
syscall() at syscall+0x197
--- syscall (number 21) ---
end of kernel
end trace frame: 0x7f7fffff7401, count: 3
0x22fc0a0109a:
https://www.openbsd.org/ddb.html describes the minimum info required in bug
reports.  Insufficient info makes it difficult to find and fix bugs.
```

![alt](https://github.com/riboseinc/fuzzbsd/blob/master/results/openbsd_6.1/ntfs/64/openbsd_6.1-image-fuzzbsd-ntfs-64.000.png "openbsd_6.1")