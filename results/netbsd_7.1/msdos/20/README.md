```
# dmesg -M netbsd.0.core -N netbsd.0
Copyright (c) 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005,
    2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017
    The NetBSD Foundation, Inc.  All rights reserved.
Copyright (c) 1982, 1986, 1989, 1991, 1993
    The Regents of the University of California.  All rights reserved.

NetBSD 7.1 (GENERIC.201703111743Z)
total memory = 65084 KB
avail memory = 45028 KB
kern.module.path=/stand/amd64/7.1/modules
timecounter: Timecounters tick every 10.000 msec
timecounter: Timecounter "i8254" frequency 1193182 Hz quality 100
innotek GmbH VirtualBox (1.2)
mainbus0 (root)
ACPI: RSDP 0xe0000 000024 (v02 VBOX  )
ACPI: XSDT 0x3ff0030 00003C (v01 VBOX   VBOXXSDT 00000001 ASL  00000061)
ACPI: FACP 0x3ff00f0 0000F4 (v04 VBOX   VBOXFACP 00000001 ASL  00000061)
ACPI: DSDT 0x3ff0470 0021C8 (v02 VBOX   VBOXBIOS 00000002 INTL 20100528)
ACPI: FACS 0x3ff0200 000040
ACPI: APIC 0x3ff0240 000054 (v02 VBOX   VBOXAPIC 00000001 ASL  00000061)
ACPI: SSDT 0x3ff02a0 0001CC (v01 VBOX   VBOXCPUT 00000002 INTL 20100528)
ACPI: All ACPI Tables successfully acquired
ioapic0 at mainbus0 apid 1: pa 0xfec00000, version 0x20, 24 pins
cpu0 at mainbus0 apid 0: Intel(R) Core(TM) i7-4850HQ CPU @ 2.30GHz, id 0x40661
acpi0 at mainbus0: Intel ACPICA 20131218
acpi0: X/RSDT: OemId <VBOX  ,VBOXXSDT,00000001>, AslId <ASL ,00000061>
acpi0: SCI interrupting at int 9
timecounter: Timecounter "ACPI-Safe" frequency 3579545 Hz quality 900
pckbc1 at acpi0 (PS2K, PNP0303) (kbd port): io 0x60,0x64 irq 1
pckbc2 at acpi0 (PS2M, PNP0F03) (aux port): irq 12
attimer1 at acpi0 (TIMR, PNP0100): io 0x40-0x43,0x50-0x53
acpivga0 at acpi0 (GFX0): ACPI Display Adapter
acpiout0 at acpivga0 (VGA, 0x0100): ACPI Display Output Device
acpivga0: connected output devices:
acpivga0:   0x0100 (acpiout0): VGA Analog Monitor, index 0, port 0, head 0
acpibat0 at acpi0 (BAT0, PNP0C0A-0): ACPI Battery
acpibat0: innotek VBOX rechargeable battery
acpibat0: granularity: low->warn 0.001 Wh, warn->full 0.001 Wh
acpiacad0 at acpi0 (AC, ACPI0003-0): ACPI AC Adapter
ACPI: Enabled 2 GPEs in block 00 to 07
ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State [\_S1_] (20131218/hwxface-646)
ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State [\_S2_] (20131218/hwxface-646)
ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State [\_S3_] (20131218/hwxface-646)
ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State [\_S4_] (20131218/hwxface-646)
pckbd0 at pckbc1 (kbd slot)
pckbc1: using irq 1 for kbd slot
wskbd0 at pckbd0: console keyboard
pms0 at pckbc1 (aux slot)
pckbc1: using irq 12 for aux slot
wsmouse0 at pms0 mux 0
pci0 at mainbus0 bus 0: configuration mode 1
pci0: i/o space, memory space enabled, rd/line, rd/mult, wr/inv ok
pchb0 at pci0 dev 0 function 0: vendor 0x8086 product 0x1237 (rev. 0x02)
pcib0 at pci0 dev 1 function 0: vendor 0x8086 product 0x7000 (rev. 0x00)
piixide0 at pci0 dev 1 function 1: Intel 82371AB IDE controller (PIIX4) (rev. 0x01)
piixide0: bus-master DMA support present
piixide0: primary channel configured to compatibility mode
piixide0: primary channel interrupting at ioapic0 pin 14
atabus0 at piixide0 channel 0
piixide0: secondary channel configured to compatibility mode
piixide0: secondary channel interrupting at ioapic0 pin 15
atabus1 at piixide0 channel 1
vga0 at pci0 dev 2 function 0: vendor 0x80ee product 0xbeef (rev. 0x00)
wsdisplay0 at vga0 kbdmux 1: console (80x25, vt100 emulation), using wskbd0
wsmux1: connecting to wsdisplay0
drm at vga0 not configured
wm0 at pci0 dev 3 function 0: Intel i82540EM 1000BASE-T Ethernet (rev. 0x02)
wm0: interrupting at ioapic0 pin 19
wm0: 32-bit 33MHz PCI bus
wm0: 64 words (6 address bits) MicroWire EEPROM
wm0: Ethernet address 08:00:27:08:cf:84
makphy0 at wm0 phy 1: Marvell 88E1011 Gigabit PHY, rev. 4
makphy0: 10baseT, 10baseT-FDX, 100baseTX, 100baseTX-FDX, auto
vendor 0x80ee product 0xcafe (miscellaneous system) at pci0 dev 4 function 0 not configured
ohci0 at pci0 dev 6 function 0: vendor 0x106b product 0x003f (rev. 0x00)
ohci0: interrupting at ioapic0 pin 22
ohci0: OHCI version 1.0
usb0 at ohci0: USB revision 1.0
piixpm0 at pci0 dev 7 function 0: vendor 0x8086 product 0x7113 (rev. 0x08)
piixpm0: interrupting at ioapic0 pin 23
iic0 at piixpm0: I2C bus
ehci0 at pci0 dev 11 function 0: vendor 0x8086 product 0x265c (rev. 0x00)
ehci0: interrupting at ioapic0 pin 19
ehci0: EHCI version 1.0
usb1 at ehci0: USB revision 2.0
isa0 at pcib0
pcppi0 at isa0 port 0x61
midi0 at pcppi0: PC speaker
sysbeep0 at pcppi0
attimer1: attached to pcppi0
acpicpu0 at cpu0: ACPI CPU
acpicpu0: C1: HLT, lat   0 us, pow     0 mW
timecounter: Timecounter "clockinterrupt" frequency 100 Hz quality 0
timecounter: Timecounter "TSC" frequency 2294835130 Hz quality 3000
acpiacad0: AC adapter online.
IPsec: Initialized Security Association Processing.
uhub0 at usb0: vendor 0x106b OHCI root hub, class 9/0, rev 1.00/1.00, addr 1
uhub0: 12 ports with 12 removable, self powered
uhub1 at usb1: vendor 0x8086 EHCI root hub, class 9/0, rev 2.00/1.00, addr 1
uhub1: 12 ports with 12 removable, self powered
wd0 at atabus0 drive 0
wd0: <VBOX HARDDISK>
wd0: drive supports 128-sector PIO transfers, LBA addressing
wd0: 16384 MB, 33288 cyl, 16 head, 63 sec, 512 bytes/sect x 33554432 sectors
wd0: 32-bit data port
wd0: drive supports PIO mode 4, DMA mode 2, Ultra-DMA mode 6 (Ultra/133)
wd0(piixide0:0:0): using PIO mode 4, Ultra-DMA mode 2 (Ultra/33) (using DMA)
atapibus0 at atabus1: 2 targets
cd0 at atapibus0 drive 0: <VBOX CD-ROM, VB2-01700376, 1.0> cdrom removable
cd0: 32-bit data port
cd0: drive supports PIO mode 4, DMA mode 2, Ultra-DMA mode 6 (Ultra/133)
cd0(piixide0:1:0): using PIO mode 4, Ultra-DMA mode 2 (Ultra/33) (using DMA)
Kernelized RAIDframe activated
pad0: outputs: 44100Hz, 16-bit, stereo
audio0 at pad0: half duplex, playback, capture
boot device: wd0
root on wd0a dumps on wd0b
root file system type: ffs
wsdisplay0: screen 1 added (80x25, vt100 emulation)
wsdisplay0: screen 2 added (80x25, vt100 emulation)
wsdisplay0: screen 3 added (80x25, vt100 emulation)
wsdisplay0: screen 4 added (80x25, vt100 emulation)
panic: buf mem pool index 55
fatal breakpoint trap in supervisor mode
trap type 1 code 0 rip ffffffff802825bd cs 8 rflags 246 cr2 7f7ff70a1bd0 ilevel 0 rsp fffffe800181ca50
curlwp 0xfffffe8003c3e660 pid 107.1 lowest kstack 0xfffffe800181a2c0
Stopped in pid 107.1 (mount_msdos) at   netbsd:breakpoint+0x5:  leave   
db{0}> trace
breakpoint() at netbsd:breakpoint+0x5
vpanic() at netbsd:vpanic+0x13c
snprintf() at netbsd:snprintf
bufpool_page_free() at netbsd:bufpool_page_free
allocbuf() at netbsd:allocbuf+0x21
getblk() at netbsd:getblk+0xfc
bio_doread.isra.4() at netbsd:bio_doread.isra.4+0x19
bread() at netbsd:bread+0x1a
fillinusemap() at netbsd:fillinusemap+0x176
msdosfs_mountfs() at netbsd:msdosfs_mountfs+0x516
msdosfs_mount() at netbsd:msdosfs_mount+0x2f0
VFS_MOUNT() at netbsd:VFS_MOUNT+0x34
mount_domount() at netbsd:mount_domount+0x122
do_sys_mount() at netbsd:do_sys_mount+0x2dd
sys___mount50() at netbsd:sys___mount50+0x33
syscall() at netbsd:syscall+0x9a
--- syscall (number 410) ---
7f7ff7083caa:
db{0}> show registers
ds          ca18
es          ca60
fs          8
gs          996d
rdi         0
rsi         ffffffff812ae000
rbp         fffffe800181ca50
rbx         104
rdx         8
rcx         0
rax         1
r8          ffffffff80d24d08    ostype+0xa899c
r9          fffffe8003fca278
r10         ffffffff80faf160    x86_mem
r11         780
r12         ffffffff80d25a14    ostype+0xa96a8
r13         fffffe800181ca88
r14         0
r15         fffffe80023cdb48
rip         ffffffff802825bd    breakpoint+0x5
cs          8
rflags      246
rsp         fffffe800181ca50
ss          10
netbsd:breakpoint+0x5:  leave   
db{0}> ps
PID    LID S CPU     FLAGS       STRUCT LWP *               NAME WAIT    
107  >   1 7   0         0   fffffe8003c3e660        mount_msdos         
105      1 3   0        80   fffffe8001dfa640              mount wait    
764      1 3   0        80   fffffe8003031a20                 sh wait    
74       1 3   0        80   fffffe8003b53180                 sh wait    
40       1 3   0        80   fffffe8003031600                 sh ttyraw  
709      1 3   0        80   fffffe8003a8aa00                 sh wait    
660      1 3   0        80   fffffe8003a985c0               sshd select  
493      1 3   0        80   fffffe8003a989e0               sshd select  
408      1 3   0        80   fffffe8003b539c0              getty ttyraw  
606      1 3   0        80   fffffe8003b535a0              getty ttyraw  
547      1 3   0        80   fffffe8003dd4160              getty ttyraw  
644      1 3   0        80   fffffe80015ea0e0              login wait    
582      1 3   0        80   fffffe8003c3ea80               cron nanoslp 
531      1 3   0        80   fffffe8001dfa220              inetd kqueue  
631      1 3   0        80   fffffe8003a981a0               qmgr kqueue  
622      1 3   0        80   fffffe8001dfaa60             pickup kqueue  
623      1 3   0        80   fffffe800378aa40             master kqueue  
406      1 3   0        80   fffffe80030311e0               sshd select  
373      1 3   0        80   fffffe800378a620             powerd kqueue  
217      1 2   0         0   fffffe8003a8a5e0            syslogd         
157      1 3   0        80   fffffe8003a8a1c0             dhcpcd select  
1        1 3   0        80   fffffe8001757960               init wait    
0       47 3   0       200   fffffe800378a200               vnd0 vndbp   
0       46 3   0       200   fffffe8001760560            physiod physiod 
0       45 3   0       200   fffffe8003dd4580           aiodoned aiodoned
0       44 3   0       200   fffffe8003dd49a0            ioflush syncer  
0       43 3   0       200   fffffe8001760140           pgdaemon pgdaemon
0       40 3   0       200   fffffe800174e940          atapibus0 sccomp  
0       37 3   0       200   fffffe80015ea500               usb1 usbevt  
0       36 3   0       200   fffffe800174e520               usb0 usbevt  
0       35 3   0       200   fffffe800174e100          cryptoret crypto_w
0       34 3   0       200   fffffe8001757540              unpgc unpgc   
0       33 3   0       200   fffffe8001757120        vmem_rehash vmem_rehash
0       32 3   0       200   fffffe8001760980           acpibat0 acpibat0
0       23 3   0       200   fffffe80015ea920               iic0 iicintr 
0       22 3   0       200   fffffe80015010c0         usbtask-dr usbtsk  
0       21 3   0       200   fffffe80015014e0         usbtask-hc usbtsk  
0       20 3   0       200   fffffe8001501900            atabus1 atath   
0       19 3   0       200   fffffe80014d50a0            atabus0 atath   
0       18 3   0       200   fffffe80014d54c0           lnxsyswq lnxsyswq
0       17 3   0       200   fffffe80014d58e0               pms0 pmsreset
0       16 3   0       200   fffffe8003ec3080             sysmon smtaskq 
0       15 3   0       200   fffffe8003ec34a0         pmfsuspend pmfsuspend
0       14 3   0       200   fffffe8003ec38c0           pmfevent pmfevent
0       13 3   0       200   fffffe8003ef6060         sopendfree sopendfr
0       12 3   0       200   fffffe8003ef6480           nfssilly nfssilly
0       11 3   0       200   fffffe8003ef68a0            cachegc cachegc 
0       10 3   0       200   fffffe8003f16040              vrele vrele   
0        9 3   0       200   fffffe8003f16460             vdrain vdrain  
0        8 3   0       200   fffffe8003f16880          modunload mod_unld
0        7 3   0       200   fffffe8003f22020            xcall/0 xcall   
0        6 1   0       200   fffffe8003f22440          softser/0         
0        5 1   0       200   fffffe8003f22860          softclk/0         
0        4 1   0       200   fffffe8003f28000          softbio/0         
0        3 1   0       200   fffffe8003f28420          softnet/0         
0        2 1   0       201   fffffe8003f28840             idle/0         
0        1 3   0       200   ffffffff8100a5e0            swapper uvm     
db{0}> call dumpsys 
dumping to dev 0,1 (offset=1967544, size=16271):
dump 
```

```
# gdb --symbols=/netbsd --quiet --eval-command="file /netbsd" --eval-command="target kvm netbsd.0.core" --eval-command "bt" --eval-command "list" --eval-command "info all-registers"
Reading symbols from /netbsd...done.
Load new symbol table from "/netbsd"? (y or n) y
Reading symbols from /netbsd...done.
0xffffffff802a0fc0 in db_fncall ()
#0  0xffffffff802a0fc0 in db_fncall ()
#1  0xffffffff802a1687 in db_command ()
#2  0xffffffff802a1a14 in db_command_loop ()
#3  0xffffffff802a6f8d in db_trap ()
#4  0xffffffff802a4240 in kdb_trap ()
#5  0xffffffff808ac6be in trap ()
#6  0xffffffff80100f46 in alltraps ()
#7  0xffffffff802825bd in breakpoint ()
#8  0xffffffff80869be9 in vpanic ()
#9  0xffffffff80869cad in panic ()
#10 0xffffffff80950db3 in buf_mempoolidx ()
#11 0xffffffff80952a19 in allocbuf ()
#12 0xffffffff809530a0 in getblk ()
#13 0xffffffff809531a3 in bio_doread.isra.4 ()
#14 0xffffffff8095328f in bread ()
#15 0xffffffff806745d3 in fillinusemap ()
#16 0xffffffff80676add in msdosfs_mountfs ()
#17 0xffffffff8067721f in msdosfs_mount ()
#18 0xffffffff8095c7df in VFS_MOUNT ()
#19 0xffffffff8095a148 in mount_domount ()
#20 0xffffffff8095ec86 in do_sys_mount ()
#21 0xffffffff8095f056 in sys___mount50 ()
#22 0xffffffff80884c2a in syscall ()
#23 0xffffffff80100691 in Xsyscall ()
1       /home/source/ab/netbsd-7-1-RELEASE/src/sys/conf/debugsyms.c: No such file or directory.
rax            <unavailable>
rbx            0xa      10
rcx            <unavailable>
rdx            <unavailable>
rsi            <unavailable>
rdi            <unavailable>
rbp            0xfffffe800181c618       0xfffffe800181c618
rsp            0xfffffe800181c580       0xfffffe800181c580
r8             <unavailable>
r9             <unavailable>
r10            <unavailable>
r11            <unavailable>
r12            0xffffffff80fb0f40       -2131030208
r13            0xffffffff801003e0       -2146434080
r14            0x0      0
r15            0x0      0
rip            0xffffffff802a0fc0       0xffffffff802a0fc0 <db_fncall+167>
eflags         <unavailable>
cs             <unavailable>
ss             <unavailable>
ds             <unavailable>
es             <unavailable>
fs             0x0      0
gs             0x0      0
st0            <unavailable>
st1            <unavailable>
st2            <unavailable>
st3            <unavailable>
st4            <unavailable>
st5            <unavailable>
st6            <unavailable>
st7            <unavailable>
fctrl          <unavailable>
fstat          <unavailable>
ftag           <unavailable>
fiseg          <unavailable>
fioff          <unavailable>
foseg          <unavailable>
fooff          <unavailable>
fop            <unavailable>
xmm0           {v4_float = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_double = {<unavailable>, <unavailable>}, v16_int8 = {
    <unavailable> <repeats 16 times>}, v8_int16 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, 
    <unavailable>}, v4_int32 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_int64 = {<unavailable>, <unavailable>}, 
  uint128 = <unavailable>}
xmm1           {v4_float = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_double = {<unavailable>, <unavailable>}, v16_int8 = {
    <unavailable> <repeats 16 times>}, v8_int16 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, 
    <unavailable>}, v4_int32 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_int64 = {<unavailable>, <unavailable>}, 
  uint128 = <unavailable>}
xmm2           {v4_float = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_double = {<unavailable>, <unavailable>}, v16_int8 = {
    <unavailable> <repeats 16 times>}, v8_int16 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, 
    <unavailable>}, v4_int32 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_int64 = {<unavailable>, <unavailable>}, 
  uint128 = <unavailable>}
xmm3           {v4_float = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_double = {<unavailable>, <unavailable>}, v16_int8 = {
    <unavailable> <repeats 16 times>}, v8_int16 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, 
    <unavailable>}, v4_int32 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_int64 = {<unavailable>, <unavailable>}, 
  uint128 = <unavailable>}
xmm4           {v4_float = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_double = {<unavailable>, <unavailable>}, v16_int8 = {
---Type <return> to continue, or q <return> to quit---
    <unavailable> <repeats 16 times>}, v8_int16 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, 
    <unavailable>}, v4_int32 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_int64 = {<unavailable>, <unavailable>}, 
  uint128 = <unavailable>}
xmm5           {v4_float = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_double = {<unavailable>, <unavailable>}, v16_int8 = {
    <unavailable> <repeats 16 times>}, v8_int16 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, 
    <unavailable>}, v4_int32 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_int64 = {<unavailable>, <unavailable>}, 
  uint128 = <unavailable>}
xmm6           {v4_float = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_double = {<unavailable>, <unavailable>}, v16_int8 = {
    <unavailable> <repeats 16 times>}, v8_int16 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, 
    <unavailable>}, v4_int32 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_int64 = {<unavailable>, <unavailable>}, 
  uint128 = <unavailable>}
xmm7           {v4_float = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_double = {<unavailable>, <unavailable>}, v16_int8 = {
    <unavailable> <repeats 16 times>}, v8_int16 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, 
    <unavailable>}, v4_int32 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_int64 = {<unavailable>, <unavailable>}, 
  uint128 = <unavailable>}
xmm8           {v4_float = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_double = {<unavailable>, <unavailable>}, v16_int8 = {
    <unavailable> <repeats 16 times>}, v8_int16 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, 
    <unavailable>}, v4_int32 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_int64 = {<unavailable>, <unavailable>}, 
  uint128 = <unavailable>}
xmm9           {v4_float = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_double = {<unavailable>, <unavailable>}, v16_int8 = {
    <unavailable> <repeats 16 times>}, v8_int16 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, 
    <unavailable>}, v4_int32 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_int64 = {<unavailable>, <unavailable>}, 
  uint128 = <unavailable>}
xmm10          {v4_float = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_double = {<unavailable>, <unavailable>}, v16_int8 = {
    <unavailable> <repeats 16 times>}, v8_int16 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, 
    <unavailable>}, v4_int32 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_int64 = {<unavailable>, <unavailable>}, 
  uint128 = <unavailable>}
xmm11          {v4_float = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_double = {<unavailable>, <unavailable>}, v16_int8 = {
    <unavailable> <repeats 16 times>}, v8_int16 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, 
    <unavailable>}, v4_int32 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_int64 = {<unavailable>, <unavailable>}, 
  uint128 = <unavailable>}
xmm12          {v4_float = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_double = {<unavailable>, <unavailable>}, v16_int8 = {
    <unavailable> <repeats 16 times>}, v8_int16 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, 
    <unavailable>}, v4_int32 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_int64 = {<unavailable>, <unavailable>}, 
  uint128 = <unavailable>}
xmm13          {v4_float = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_double = {<unavailable>, <unavailable>}, v16_int8 = {
    <unavailable> <repeats 16 times>}, v8_int16 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, 
    <unavailable>}, v4_int32 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_int64 = {<unavailable>, <unavailable>}, 
  uint128 = <unavailable>}
xmm14          {v4_float = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_double = {<unavailable>, <unavailable>}, v16_int8 = {
    <unavailable> <repeats 16 times>}, v8_int16 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, 
---Type <return> to continue, or q <return> to quit---
    <unavailable>}, v4_int32 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_int64 = {<unavailable>, <unavailable>}, 
  uint128 = <unavailable>}
xmm15          {v4_float = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_double = {<unavailable>, <unavailable>}, v16_int8 = {
    <unavailable> <repeats 16 times>}, v8_int16 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, <unavailable>, 
    <unavailable>}, v4_int32 = {<unavailable>, <unavailable>, <unavailable>, <unavailable>}, v2_int64 = {<unavailable>, <unavailable>}, 
  uint128 = <unavailable>}
mxcsr          <unavailable>
(gdb)
```
