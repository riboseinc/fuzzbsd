```
[*] Tue Aug  8 14:02:12 UTC 2017 mount 'image-fuzzbsd-msdos-18.179' '/dev/vnd0'
uvm_fault(0xffffffff810ba6c0, 0xffff800014a00000, 1) -> e
fatal page fault in supervisor mode
trap type 6 code 0 rip ffffffff806744fd cs 8 rflags 10287 cr2 ffff800014a000000 i
level 0 rsp fffffe8003347bd8
curlwp 0xfffffe8024857a80 pid 6312.1 lowest kstack 0xfffffe80033452c0
panic: trap
cpu0: Begin traceback...
vpanic() at netbsd:vpanic+0x13c
snprintf() at netbsd:snprintf
startlwp() at netbsd:startlwp
alltraps() at netbsd:alltraps+0x96
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
dump 89 88 87 86 85 84 83 82 81 80
```

![alt](https://github.com/riboseinc/fuzzbsd/blob/master/results/netbsd_7.1/msdos/18/netbsd_7.1-image-fuzzbsd-msdos-18.179.png "netbsd_7.1")
