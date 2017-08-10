```
[*] Wed Aug  9 07:26:38 HKT 2017 confdisk 'vn0' 'image—fuzzbsd—ntfs—64.000'
[*] Wed Aug  9 07:26:38 HKT 2017 mount 'image—fuzzbsd—ntfs—64.000' '/deu/vn0'
Fatal trap 12: page fault while in kernel mode
cpuid = 0; lapic—>id = 00000000
fault virtual address   = 0xfffffffffffffff8
fault code              = supervisor read data, page not present
instruction pointer     = 0x8:0xffffffff82c02f21
stack pointer           = 0x10:0xffffff809b3bb078
frame pointer           = 0x10:0xffffff809b3bb0d8
code segment            = base 0x0, limit 0xfffff, type 0x1b
                        = DPL 0, pres 1, long 0, def32 0, gran 1
processor eflags        = interrupt enabled, resume, IOPL = 0
current process         = 47602
current thread          = pri 6
kernel: type 12 trap, code=0

CPU0 stopping CPUs: 0x00000000
 stopped
Stopped at ntfs_procfixups+0x1:         movl    (%rdx),%eax
db> trace
ntfs_procfixups() at ntfs_procfixups+0x1 0xffffffff82c02f21
ntfs_vgetex() at ntfs_vgetex+0x1e1 0xffffffff82c00ff1
ntfs_vget() at ntfs_vget+0x29 0xffffffff82c01169
vfs_vget() at vfs_vget+0x5b 0xffffffff8067d3ab
ntfs_mountfs.isra.0() at ntfs_mountfs.isra.0+0x377 0xffffffff82c008e7
ntfs_mount() at ntfs_mount+0x231 0xffffffff82c00df1
vfs_mount() at vfs_mount+0x5a 0xffffffff8067cefa
sys_mount() at sys_mount+0x5fd 0xffffffff806729fd
syscall2() at syscall2+0x4d6 0xffffffff80a5c786
Xfast_syscall() at Xfast_syscall+0xcb 0xffffffff80a4428b
db>
```

![alt](https://github.com/riboseinc/fuzzbsd/blob/master/results/dragonflybsd_4.8.1/ntfs/64/dragonflybsd_4.8.1-image-fuzzbsd-ntfs-64.000-01.png "dragonflybsd_4.8.1")
![alt](https://github.com/riboseinc/fuzzbsd/blob/master/results/dragonflybsd_4.8.1/ntfs/64/dragonflybsd_4.8.1-image-fuzzbsd-ntfs-64.000-02.png "dragonflybsd_4.8.1")