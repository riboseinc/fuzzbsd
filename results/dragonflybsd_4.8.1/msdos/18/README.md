```
[*] Wed Aug  9 06:14:51 HKT 2017 confdisk 'vn0' 'image—fuzzbsd—msdos—18.034'
[*] Wed Aug  9 06:14:51 HKT 2017 mount 'image—fuzzbsd—msdos—18.034' '/dev/vn0'
panic: assertion "(((intptr_t)chunk ^ (intptr_t)z) & ZoneMask) == 0" failed in c
hunk_mark_allocated at /home/justin/release/4_8/sys/kern/kern_slaballoc.c:1480
cpuid = 0
Trace beginning at frame 0xffffff809b407508
panic() at panic+0x236 0xffffffff805e5e66
panic() at panic+0x236 0xffffffff805e5e66
chunk_mark_allocated() at chunk_mark_allocated+0x4c 0xffffffff80295c3c
kmalloc() at kmalloc+0x570 0xffffffff80561f90
vm_object_allocate() at vm_object_allocate+0x29 0xffffffff808add09
vm_object_shadow() at vm_object_shadow+0x71 0xffffffff808afcc1
Debugger("panic")

CPU0 stopping CPUs: 0x00000000
 stopped
Stopped at      Debugger+0x7c: movb     $0,0xd9df69(%rip)
db>
```

![alt](https://github.com/riboseinc/fuzzbsd/blob/master/results/dragonflybsd_4.8.1/msdos/18/dragonflybsd_4.8.1-image-fuzzbsd-msdos-18.034.png "dragonflybsd_4.8.1")