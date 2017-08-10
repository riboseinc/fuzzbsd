```
[*] Wed Aug 9 05:37:03 HKT 2017 mount 'image—fuzzbsd—msdos—12.125' '/dev/vn0'
mount_msdos: /dev/vn0: Invalid argument
[*] Wed Aug 9 05:37:03 HKT 2017 confdisk 'vn0' 'image-fuzzbSd-msdos-12.126'
[*] Wed Aug 9 05:37:03 HKT 2017 mount 'image—fuzzbsd—msdos—IZ.126'
mount_msdos: /dev/vn0: Invalid argument
[*] Wed Aug 9 05:37:03 HKT 2017 confdisk 'vn0' 'image-fuzzbsd-msdos-12.127'
[*] Wed Aug 9 05:37:03 HKT 2017 mount 'image—fuzzbsd—msdos—IZ.127'
mount_msdos: /dev/vn0: Invalid argument
[*] Wed Aug 9 05:37:03 HKT 2017 confdisk 'vn0' 'image—fuzzbsd—msdos—12.128'
[*] Wed Aug 9 05:37:03 HKT 2017 mount 'image—fuzzbsd—msdos—12.128' '/dev/vn0'
panic: getblk: size(98304) > MAXBSIZE(65536)
cpuid = 0
Trace beginning at frame 0xffffff809b37d2b8
panic() at panic+0x236 0xffffffff805e5e66
panic() at panic+0x236 0xffffffff80565e66
gethlkt) at getblk+0x519 0xffffffff80651e39
breadnxt) at breadnx+0x266 0xffffffff80652156
fillinusemap() at fillinusemap+0x1b4 0xffffffff80687cd4
msdosfs_mount() at msdosfs_mount+0xc39 0xffffffff8068a829
Debugger("panic")

CPU0 stopping CPUs: 0x00000000
 stopped
Stopped at      Debugger+0x7c:  movb $0,0xd9df69(%rip)
db>
```

![alt text](https://github.com/riboseinc/fuzzbsd/blob/master/results/dragonflybsd_4.8.1/msdos/12/dragonflybsd_4.8.1-image-fuzzbsd-msdos-12.128.png "dragonflybsd")
