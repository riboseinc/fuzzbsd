```
ntfs_loadntnode: BREAD FAILED
ntfs_vget: CAN'T LOAD ATTRIBUTES FOR INO: 0
mount_ntfs: /deu/vn0: Invalid argument
[*] cleaning up previously used images and logfile
[*] running 'stringinject' on 'images/ntfs.img'
[*] Wed Aug 9 06:52:22 HKT 2017 confdisk 'vn0' 'image—fuzzbsd—ntfs—12.000'
[*] Wed Aug 9 06:52:22 HKT 2017 mount 'image—fuzzbsd—ntfs—12.000' '/deu/vn0'


Fatal trap 18: integer divide fault while in kernel mode
cpuid = 0: lapic—>id = 00000000
instruction pointer     = 0x8:0xffffffff82c009c8
stack pointer           = 0x10:0xffffff809b3a61b8
frame pointer           = 0x10:0xffffff809b3a62f8
code segment            = base 0x0, limit 0xfffff, type 0x1b
                        = DPL 0, pres 1, long 1, def32 0, gran 1
processor eflags        = interrupt enabled, resume, IOPL = 0
current process         = 121446
current thread          = pri 6
kernel: type 18 trap, code=0

CPU0 stopping CPUs: 0x00000000
 stopped
Stopped at      ntfs_mountfs.isra.0+0x458:      idivl %ecx,%eax
db> trace
ntfs_mountfs.isra.0() at ntfs_mountfs.isra.0+0x458 0xffffffff82c009c8
ntfs_mnunt() at ntfs_mount+0x231 0xffffffff82c00df1
vfs_mnunt() at vfs_mount+0x5a 0xffffffff806763fa
sys_mount() at sys_mount+0x5fd 0xffffffff306729fd
syscall2() at syscall2+0x4d6 0xffffffff80a5c786
Xfast_syscall() at Xfast_syscall+0xcb 0xffffffff80a4428b
db>
```

![alt](https://github.com/riboseinc/fuzzbsd/blob/master/results/dragonflybsd_4.8.1/ntfs/12/dragonflybsd_4.8.1-image-fuzzbsd-ntfs-12.000-01.png "dragonflybsd_4.8.1")
![alt](https://github.com/riboseinc/fuzzbsd/blob/master/results/dragonflybsd_4.8.1/ntfs/12/dragonflybsd_4.8.1-image-fuzzbsd-ntfs-12.000-02.png "dragonflybsd_4.8.1")