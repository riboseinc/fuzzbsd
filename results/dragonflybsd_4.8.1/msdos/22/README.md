```
[*] cleaning up previously used images and logfile
[*] running 'stringinject' on 'images/msdosfs.img'
[*] Wed Aug  9 06:18:55 HKT 2017 confdisk 'vn0' 'image—fuzzbsd—msdos—22.000'
[*] Wed Aug  9 06:18:55 HKT 2017 mount 'image—fuzzbsd—msdos—22.000' '/deu/vn0'
Warning: number of clusters (2867) exceeds FAT capacity (0)


Fatal trap 12: page fault while in kernel mode
cpuid = 0; lapic—>id = 00000000
fault virtual address   = 0xfffffffffffffff8
fault code              = supervisor write data, page not present
instruction pointer     = 0x8:0xffffffff80687bf6
stack pointer           = 0x10:0xffffff809b3b6438
frame pointer           = 0x10:0xffffff809b3b6488
code segment            = base 0x0, limit 0xfffff, type 0x1b
                        = DPL 0, pres 1, long 1, def32 0, gran 1
processor eflags        = interrupt enabled, resume, IOPL = 0
current process         = 32305
current thread          = pri 6
kernel: type 12 trap, code=2

CPU0 stopping CPUs: 0x00000000
 stopped
Stopped at fillinusemap+0xd6:           andl    %eax,(%rdx,%rsi,4)
db>
```

![alt](https://github.com/riboseinc/fuzzbsd/blob/master/results/dragonflybsd_4.8.1/msdos/22/dragonflybsd_4.8.1-image-fuzzbsd-msdos-22.000.png "dragonflybsd_4.8.1")