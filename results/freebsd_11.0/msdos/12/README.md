```
[*] Tue Aug  8 14:11:42 HKT 2017 confdisk 'md0' 'image-fuzzbsd-msdos-12.008'
[*] Tue Aug  8 14:11:42 HKT 2017 mount 'image-fuzzbsd-msdos-12.008' '/dev/md0'
mount: Using "-t msdosfs", since "-t msdos" is deprecated.
panic: vm_fault: fault on nofault entry, addr: fffffe003d591000
cpuid = 0
KDB: stack backtrace:
#0 0xffffffff80b24077 at kdb_backtrace+0x67
#1 0xffffffff80ad93e2 at vpanic+0x182
#2 0xffffffff80ad9253 at panic+0x43
#3 0xffffffff80e12601 at vm_fault_hold+0x2721
#4 0xffffffff80e0fe98 at vm_fault+0x78
#5 0xffffffff80fa0e39 at trap_pfault+0x78
#6 0xffffffff80fa04cc at trap+0x26c
#7 0xffffffff80f84141 at calltrap+0x8
#8 0xffffffff8098e8f6 at msdosfs_mount+0x10f6
#9 0xffffffff80ba1ae0 at vfs_donmount+0xf90
#10 0xffffffff80ba0b22 at sys_nmount+0x72
#11 0xffffffff80fa168e at amd64_syscall+0x4ce
#12 0xffffffff80f8442b at Xfast_syscall+0xfb
Uptime: 4m39s
Dumping 116 out of 991 MB:
```

![alt](https://github.com/riboseinc/fuzzbsd/blob/master/results/freebsd_11.0/msdos/12/freebsd_11.0-image-fuzzbsd-msdos-12.008.png "freebsd_11.0")