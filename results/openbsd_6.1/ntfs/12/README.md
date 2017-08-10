```
[*] Wed Aug  9 06:57:33 HKT 2017 confdisk 'vnd0' 'image-fuzzbsd-ntfs-12.000'
[*] Wed Aug  9 06:57:34 HKT 2017 mount 'image-fuzzbsd-ntfs-12.000' '/dev/vnd0'
kernel: integer divide fault trap, code=0
Stopped at      ntfs_mountfs+0x62e      idivl    %ecx,%eax
ddb> trace
ntfs_mountfs() at ntfs_mountfs+0x62e
ntfs_mount() at ntfs_mount+0x21c
sys_mount() at sys_mount+0x271
syscall() at syscall+0x197
--- syscall (number 21) ---
end of kernel
end trace frame: 0x7f7ffffe5c01, count: -4
0x111a0df0109a:
ddb>
```

![alt](https://github.com/riboseinc/fuzzbsd/blob/master/results/openbsd_6.1/ntfs/12/openbsd_6.1-image-fuzzbsd-ntfs-12.000.png "openbsd_6.1")
