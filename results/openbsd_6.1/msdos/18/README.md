```
[*] Wed Aug  9 06:14:46 HKT 2017 confdisk 'vnd0' 'image-fuzzbsd-msdos-18.178'
[*] Wed Aug  9 06:14:46 HKT 2017 mount 'image-fuzzbsd-msdos-18.178' '/dev/vnd0'
uvm_fault(0xffffff003b682f00, 0x88, 0, 1) -> e
kernel: page fault trap, code=0
Stopped at      brelse+0x18:    cmpq    $0,clean_idt+0x68(%rbx)
ddb> trace
brelse() at brelse+0x18
fillinusemap() at fillinusemap+0x1ad
msdosfs_mountfs() at msdosfs_mountfs+0x57b
msdosfs_mount() at msdosfs_mount+0x3bb
sys_mount() at sys_mount+0x271
syscall() at syscall+0x197
--- syscall (number 21) ---
end of kernel
end trace frame: 0x7f7ffffcf401, count: -6
0x75c930023aa:
ddb>
```

![alt](https://github.com/riboseinc/fuzzbsd/blob/master/results/openbsd_6.1/msdos/18/openbsd_6.1-image-fuzzbsd-msdos-18.178.png "openbsd_6.1")
