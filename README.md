FuzzBSD, a filesystem image fuzzing script to test BSD kernels
==============================================================

A valid filesystem image gets corrupted by changing a the hex value of a single offset 255 times (0x00 - 0xff). FuzzBSD will then loop through each of the 255 images, configures a vnode/memory disk and then attempts a mount.
If the image fails to mount then the disk will be unconfigured and the next image will be tried. If the kernel panics you can check the logfile which offset and which hex value caused the panic.

```stringinject``` from the [retrace project](https://github.com/riboseinc/retrace) is used to corrupt the filesystem images.

The following BSDs are supported:
- NetBSD 7.1
- OpenBSD 6.1
- FreeBSD 11
- DragonFlyBSD 4.8
- Darwin 16.7.0 / macOS Sierra (COMING)

The following filesystem image types are currently supported:
- msdosfs
- NTFS
- ISO 9660
- ext2fs
- UDF

The filesystem images used have been pre-made on CentOS 7 with the ```gen-fs-images/gen-fs-images.sh``` script. This script allows you to recreate the filesystem images yourself if you don't trust the ones I have made. Not every BSD supports each filesystem out of the box, so it really depends on which flavor of BSD you are running FuzzBSD on.

