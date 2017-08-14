```
# kgdb /boot/kernel/kernel ./vmcore.0
GNU gdb 6.1.1 [FreeBSD]
Copyright 2004 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you are
welcome to change it and/or distribute copies of it under certain conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for details.
This GDB was configured as "amd64-marcel-freebsd"...

Unread portion of the kernel message buffer:
panic: vm_fault: fault on nofault entry, addr: fffffe00066bd000
cpuid = 0
KDB: stack backtrace:
#0 0xffffffff80b24077 at kdb_backtrace+0x67
#1 0xffffffff80ad93e2 at vpanic+0x182
#2 0xffffffff80ad9253 at panic+0x43
#3 0xffffffff80e12601 at vm_fault_hold+0x2721
#4 0xffffffff80e0fe98 at vm_fault+0x78
#5 0xffffffff80fa0e39 at trap_pfault+0xf9
#6 0xffffffff80fa04cc at trap+0x26c
#7 0xffffffff80f84141 at calltrap+0x8
#8 0xffffffff8098e8f6 at msdosfs_mount+0x10f6
#9 0xffffffff80ba1ae0 at vfs_donmount+0xf90
#10 0xffffffff80ba0b22 at sys_nmount+0x72
#11 0xffffffff80fa168e at amd64_syscall+0x4ce
#12 0xffffffff80f8442b at Xfast_syscall+0xfb
Uptime: 1m16s
Dumping 68 out of 95 MB:..24%..47%..70%..94%

#0  doadump (textdump=<value optimized out>) at pcpu.h:221
221	pcpu.h: No such file or directory.
	in pcpu.h
(kgdb) bt
#0  doadump (textdump=<value optimized out>) at pcpu.h:221
#1  0xffffffff80ad8e69 in kern_reboot (howto=260) at /usr/src/sys/kern/kern_shutdown.c:366
#2  0xffffffff80ad941b in vpanic (fmt=<value optimized out>, ap=<value optimized out>) at /usr/src/sys/kern/kern_shutdown.c:759
#3  0xffffffff80ad9253 in panic (fmt=0x0) at /usr/src/sys/kern/kern_shutdown.c:690
#4  0xffffffff80e12601 in vm_fault_hold (map=<value optimized out>, vaddr=<value optimized out>, fault_type=<value optimized out>, 
    fault_flags=<value optimized out>, m_hold=<value optimized out>) at /usr/src/sys/vm/vm_fault.c:330
#5  0xffffffff80e0fe98 in vm_fault (map=0xfffff80003000000, vaddr=<value optimized out>, fault_type=1 '\001', fault_flags=<value optimized out>)
    at /usr/src/sys/vm/vm_fault.c:273
#6  0xffffffff80fa0e39 in trap_pfault (frame=0xfffffe000025b410, usermode=0) at /usr/src/sys/amd64/amd64/trap.c:741
#7  0xffffffff80fa04cc in trap (frame=0xfffffe000025b410) at /usr/src/sys/amd64/amd64/trap.c:442
#8  0xffffffff80f84141 in calltrap () at /usr/src/sys/amd64/amd64/exception.S:236
#9  0xffffffff8098abdb in fillinusemap (pmp=<value optimized out>) at /usr/src/sys/fs/msdosfs/msdosfs_fat.c:904
#10 0xffffffff8098e8f6 in msdosfs_mount (mp=0xfffff800033ff000) at /usr/src/sys/fs/msdosfs/msdosfs_vfsops.c:730
#11 0xffffffff80ba1ae0 in vfs_donmount (td=<value optimized out>, fsflags=<value optimized out>, fsoptions=<value optimized out>)
    at /usr/src/sys/kern/vfs_mount.c:818
#12 0xffffffff80ba0b22 in sys_nmount (td=0xfffff8000340d500, uap=0xfffffe000025ba40) at /usr/src/sys/kern/vfs_mount.c:417
#13 0xffffffff80fa168e in amd64_syscall (td=<value optimized out>, traced=0) at subr_syscall.c:135
#14 0xffffffff80f8442b in Xfast_syscall () at /usr/src/sys/amd64/amd64/exception.S:396
#15 0x0000000800a70f6a in ?? ()
Previous frame inner to this frame (corrupt stack?)
Current language:  auto; currently minimal
(kgdb) 
```

```
# dmesg
Copyright (c) 1992-2016 The FreeBSD Project.
Copyright (c) 1979, 1980, 1983, 1986, 1988, 1989, 1991, 1992, 1993, 1994
	The Regents of the University of California. All rights reserved.
FreeBSD is a registered trademark of The FreeBSD Foundation.
FreeBSD 11.0-RELEASE-p1 #0 r306420: Thu Sep 29 01:43:23 UTC 2016
    root@releng2.nyi.freebsd.org:/usr/obj/usr/src/sys/GENERIC amd64
FreeBSD clang version 3.8.0 (tags/RELEASE_380/final 262564) (based on LLVM 3.8.0)
VT(vga): text 80x25
CPU: Intel(R) Core(TM) i7-4850HQ CPU @ 2.30GHz (2294.74-MHz K8-class CPU)
  Origin="GenuineIntel"  Id=0x40661  Family=0x6  Model=0x46  Stepping=1
  Features=0x783fbff<FPU,VME,DE,PSE,TSC,MSR,PAE,MCE,CX8,APIC,SEP,MTRR,PGE,MCA,CMOV,PAT,PSE36,MMX,FXSR,SSE,SSE2>
  Features2=0x5ed8220b<SSE3,PCLMULQDQ,MON,SSSE3,CX16,SSE4.1,SSE4.2,MOVBE,POPCNT,AESNI,XSAVE,OSXSAVE,AVX,RDRAND>
  AMD Features=0x28100800<SYSCALL,NX,RDTSCP,LM>
  AMD Features2=0x21<LAHF,ABM>
  Structured Extended Features=0x2000<NFPUSG>
  TSC: P-state invariant
real memory  = 134152192 (127 MB)
avail memory = 86577152 (82 MB)
Event timer "LAPIC" quality 400
ACPI APIC Table: <VBOX   VBOXAPIC>
random: unblocking device.
ioapic0: Changing APIC ID to 1
ioapic0 <Version 2.0> irqs 0-23 on motherboard
random: entropy device external interface
kbd1 at kbdmux0
netmap: loaded module
module_register_init: MOD_LOAD (vesa, 0xffffffff8101c950, 0) error 19
random: registering fast source Intel Secure Key RNG
random: fast provider: "Intel Secure Key RNG"
vtvga0: <VT VGA driver> on motherboard
cryptosoft0: <software crypto> on motherboard
acpi0: <VBOX VBOXXSDT> on motherboard
acpi0: Power Button (fixed)
acpi0: Sleep Button (fixed)
cpu0: <ACPI CPU> on acpi0
attimer0: <AT timer> port 0x40-0x43,0x50-0x53 on acpi0
Timecounter "i8254" frequency 1193182 Hz quality 0
Event timer "i8254" frequency 1193182 Hz quality 100
Timecounter "ACPI-fast" frequency 3579545 Hz quality 900
acpi_timer0: <32-bit timer at 3.579545MHz> port 0x4008-0x400b on acpi0
pcib0: <ACPI Host-PCI bridge> port 0xcf8-0xcff on acpi0
pci0: <ACPI PCI bus> on pcib0
isab0: <PCI-ISA bridge> at device 1.0 on pci0
isa0: <ISA bus> on isab0
atapci0: <Intel PIIX4 UDMA33 controller> port 0x1f0-0x1f7,0x3f6,0x170-0x177,0x376,0xd000-0xd00f at device 1.1 on pci0
ata0: <ATA channel> at channel 0 on atapci0
ata1: <ATA channel> at channel 1 on atapci0
vgapci0: <VGA-compatible display> mem 0xe0000000-0xe0ffffff irq 18 at device 2.0 on pci0
vgapci0: Boot video device
em0: <Intel(R) PRO/1000 Legacy Network Connection 1.1.0> port 0xd010-0xd017 mem 0xf0000000-0xf001ffff irq 19 at device 3.0 on pci0
em0: Ethernet address: 08:00:27:dd:aa:53
em0: netmap queues/slots: TX 1/256, RX 1/256
ohci0: <Apple KeyLargo/Intrepid USB controller> mem 0xf0804000-0xf0804fff irq 22 at device 6.0 on pci0
usbus0 on ohci0
pci0: <bridge> at device 7.0 (no driver attached)
ehci0: <Intel 82801FB (ICH6) USB 2.0 controller> mem 0xf0805000-0xf0805fff irq 19 at device 11.0 on pci0
usbus1: EHCI version 1.0
usbus1 on ehci0
battery0: <ACPI Control Method Battery> on acpi0
acpi_acad0: <AC Adapter> on acpi0
atkbdc0: <Keyboard controller (i8042)> port 0x60,0x64 irq 1 on acpi0
atkbd0: <AT Keyboard> irq 1 on atkbdc0
kbd0 at atkbd0
atkbd0: [GIANT-LOCKED]
psm0: <PS/2 Mouse> irq 12 on atkbdc0
psm0: [GIANT-LOCKED]
psm0: model IntelliMouse Explorer, device ID 4
orm0: <ISA Option ROMs> at iomem 0xc0000-0xc7fff,0xe2000-0xe2fff on isa0
vga0: <Generic ISA VGA> at port 0x3c0-0x3df iomem 0xa0000-0xbffff on isa0
atrtc0: <AT realtime clock> at port 0x70 irq 8 on isa0
Event timer "RTC" frequency 32768 Hz quality 0
ppc0: cannot reserve I/O port range
Timecounters tick every 1.000 msec
nvme cam probe device init
usbus0: 12Mbps Full Speed USB v1.0
usbus1: 480Mbps High Speed USB v2.0
ugen0.1: <Apple> at usbus0
uhub0: <Apple OHCI root HUB, class 9/0, rev 1.00/1.00, addr 1> on usbus0
ugen1.1: <Intel> at usbus1
uhub1: <Intel EHCI root HUB, class 9/0, rev 2.00/1.00, addr 1> on usbus1
ada0 at ata0 bus 0 scbus0 target 0 lun 0
ada0: <VBOX HARDDISK 1.0> ATA-6 device
cd0 at ata1 bus 0 scbus1 target 0 lun 0
cd0: <VBOX CD-ROM 1.0> Removable CD-ROM SCSI device
cd0: Serial Number VB2-01700376
cd0: 33.300MB/s transfers (UDMA2, ATAPI 12bytes, PIO 65534bytes)
cd0: Attempt to query device size failed: NOT READY, Medium not present
ada0: Serial Number VBa8519eec-bd0b8736
ada0: 33.300MB/s transfers (UDMA2, PIO 65536bytes)
ada0: 16384MB (33554432 512 byte sectors)
taskqgroup_adjust failed cnt: 1 stride: 1 mp_ncpus: 1 smp_started: 0
taskqgroup_adjust failed cnt: 1 stride: 1 mp_ncpus: 1 smp_started: 0
Timecounter "TSC-low" frequency 1147369681 Hz quality 1000
Trying to mount root from ufs:/dev/ada0s1a [rw]...
WARNING: / was not properly dismounted
WARNING: /: mount pending error: blocks 64 files 2
warning: total configured swap (209664 pages) exceeds maximum recommended amount (188448 pages).
warning: increase kern.maxswzone or reduce amount of swap.
uhub0: 12 ports with 12 removable, self powered
em0: link state changed to UP
uhub1: 12 ports with 12 removable, self powered
```
