FuzzBSD results
===============

Number of panics due to corrupt filesystem images:

|              | msdosfs | ext2 | cd9660 | NTFS |
|--------------|---------|------|--------|------|
| DragonFlyBSD | 3       | 0    | 0      | 2    |
| NetBSD       | 4       | 0    | 0      | 1    |
| OpenBSD      | 1       | 0    | 0      | 2    |
| FreeBSD      | 1       | 0    | 0      | -    |

Below are the directories in this Git repo that contain filesystem images that will crash your BSD.
They also contain the dmesg of my test systems and the console outputs of when the panic occurred.

## msdosfs offset 12
```
./netbsd_7.1/msdos/12/
./dragonflybsd_4.8.1/msdos/12/
./freebsd_11.0/msdos/12/
```

## msdosfs offset 16
```
./dragonflybsd_4.8.1/msdos/16/
```

## msdosfs offset 18
```
./netbsd_7.1/msdos/18/
./openbsd_6.1/msdos/18/
./dragonflybsd_4.8.1/msdos/18/
```

## msdosfs offset 20
```
./netbsd_7.1/msdos/20/
```

## msdosfs offset 22
```
./netbsd_7.1/msdos/22/
./dragonflybsd_4.8.1/msdos/22/
```

## NTFS offset 12
```
./netbsd_7.1/ntfs/12/
./openbsd_6.1/ntfs/12/
./dragonflybsd_4.8.1/ntfs/12/
```

## NTFS offset 64
```
./openbsd_6.1/ntfs/64/
./dragonflybsd_4.8.1/ntfs/64/
```
