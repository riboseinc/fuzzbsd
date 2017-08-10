```
[*] Wed Aug   9 06:11:17 HKT 2017 confdisk 'vn0' 'image-fuzzbsd-msdos-16.158'
[*] Wed Aug   9 06:11:17 HKT 2017 mount 'image-fuzzbsd-msdos-16.158' '/dev/vn0'
[*] Wed Aug   9 06:11:17 HKT 2017 confdisk 'vn0' 'image-fuzzbsd-msdos-16.159'
[*] Wed Aug   9 06:11:17 HKT 2017 mount 'image-fuzzbsd-msdos-16.159' '/dev/vn0'
[*] Wed Aug   9 06:11:17 HKT 2017 confdisk 'vn0' 'image-fuzzbsd-msdos-16.160'
[*] Wed Aug   9 06:11:17 HKT 2017 mount 'image-fuzzbsd-msdos-16.160' '/dev/vn0'
[*] Wed Aug   9 06:11:17 HKT 2017 confdisk 'vn0' 'image-fuzzbsd-msdos-16.161'
[*] Wed Aug   9 06:11:17 HKT 2017 mount 'image-fuzzbsd-msdos-16.161' '/dev/vn0'
[*] Wed Aug   9 06:11:17 HKT 2017 confdisk 'vn0' 'image-fuzzbsd-msdos-16.162'
[*] Wed Aug   9 06:11:17 HKT 2017 mount 'image-fuzzbsd-msdos-16.162' '/dev/vn0'
panic: BADFREE2
cpuid = 0
Trace beginning at frame 0xffffff309b3ac3d8
panic() at panic+0x236 0xffffffff805e5e66
panic() at panic+0x236 0xffffffff805e5e66
kmalloc_destroy() at kmalloc_destroy 0xffffffff805e2cc0
msdosfs_reclaim() at msdosfs_reclaim+0x79 0xffffffff80686719
vop_reclaim() at vop_reclaim+0x67 0xffffffff8067b517
vclean_vxlocked() at vclean_vxlocked+0x1b8 0xffffffff8066a958
Debugger("panic")

CPU0 stopping CPUs: 0x00000000
 stopped
Stopped at      Debugger+0x7c:  movb $0,0xd9df69(%rip)
db>
```

![alt](https://github.com/riboseinc/fuzzbsd/blob/master/results/dragonflybsd_4.8.1/msdos/16/dragonflybsd_4.8.1-image-fuzzbsd-msdos-16.162.png "dragonflybsd_4.8.1")
