```
# dmesg -M bsd.0.core -N bsd.0
OpenBSD 6.1 (GENERIC) #19: Sat Apr  1 13:42:46 MDT 2017
    deraadt@amd64.openbsd.org:/usr/src/sys/arch/amd64/compile/GENERIC
real mem = 50266112 (47MB)
avail mem = 44310528 (42MB)
mpath0 at root
scsibus0 at mpath0: 256 targets
mainbus0 at root
bios0 at mainbus0: SMBIOS rev. 2.5 @ 0xe1000 (10 entries)
bios0: vendor innotek GmbH version "VirtualBox" date 12/01/2006
bios0: innotek GmbH VirtualBox
acpi0 at bios0: rev 2
acpi0: sleep states S0 S5
acpi0: tables DSDT FACP APIC SSDT
acpi0: wakeup devices
acpitimer0 at acpi0: 3579545 Hz, 32 bits
acpimadt0 at acpi0 addr 0xfee00000: PC-AT compat
cpu0 at mainbus0: apid 0 (boot processor)
cpu0: Intel(R) Core(TM) i7-4850HQ CPU @ 2.30GHz, 2280.97 MHz
cpu0: FPU,VME,DE,PSE,TSC,MSR,PAE,MCE,CX8,APIC,SEP,MTRR,PGE,MCA,CMOV,PAT,PSE36,CFLUSH,MMX,FXSR,SSE,SSE2,SSE3,PCLMUL,MWAIT,SSSE3,CX16,SSE4.1,SSE4.2,MOVBE,POPCNT,AES,XSAVE,AVX,RDRAND,NXE,RDTSCP,LONG,LAHF,ABM,ITSC
cpu0: 256KB 64b/line 8-way L2 cache
cpu0: TSC frequency 2280968020 Hz
cpu0: smt 0, core 0, package 0
mtrr: CPU supports MTRRs but not enabled by BIOS
cpu0: apic clock running at 1000MHz
cpu0: mwait min=64, max=64
ioapic0 at mainbus0: apid 1 pa 0xfec00000, version 20, 24 pins
acpiprt0 at acpi0: bus 0 (PCI0)
acpicpu0 at acpi0: C1(@1 halt!)
"PNP0303" at acpi0 not configured
"PNP0F03" at acpi0 not configured
acpibat0 at acpi0: BAT0 model "1" serial 0 type VBOX oem "innotek"
acpiac0 at acpi0: AC unit online
acpivideo0 at acpi0: GFX0
pci0 at mainbus0 bus 0
pchb0 at pci0 dev 0 function 0 "Intel 82441FX" rev 0x02
pcib0 at pci0 dev 1 function 0 "Intel 82371SB ISA" rev 0x00
pciide0 at pci0 dev 1 function 1 "Intel 82371AB IDE" rev 0x01: DMA, channel 0 configured to compatibility, channel 1 configured to compatibility
wd0 at pciide0 channel 0 drive 0: <VBOX HARDDISK>
wd0: 128-sector PIO, LBA, 16384MB, 33554432 sectors
wd0(pciide0:0:0): using PIO mode 4, Ultra-DMA mode 2
atapiscsi0 at pciide0 channel 1 drive 0
scsibus1 at atapiscsi0: 2 targets
cd0 at scsibus1 targ 0 lun 0: <VBOX, CD-ROM, 1.0> ATAPI 5/cdrom removable
cd0(pciide0:1:0): using PIO mode 4, Ultra-DMA mode 2
vga1 at pci0 dev 2 function 0 "InnoTek VirtualBox Graphics Adapter" rev 0x00
wsdisplay0 at vga1 mux 1: console (80x25, vt100 emulation)
wsdisplay0: screen 1-5 added (80x25, vt100 emulation)
em0 at pci0 dev 3 function 0 "Intel 82540EM" rev 0x02: apic 1 int 19, address 08:00:27:92:97:89
"InnoTek VirtualBox Guest Service" rev 0x00 at pci0 dev 4 function 0 not configured
ohci0 at pci0 dev 6 function 0 "Apple Intrepid USB" rev 0x00: apic 1 int 22, version 1.0
piixpm0 at pci0 dev 7 function 0 "Intel 82371AB Power" rev 0x08: apic 1 int 23
iic0 at piixpm0
ehci0 at pci0 dev 11 function 0 "Intel 82801FB USB" rev 0x00: apic 1 int 19
usb0 at ehci0: USB revision 2.0
uhub0 at usb0 configuration 1 interface 0 "Intel EHCI root hub" rev 2.00/1.00 addr 1
isa0 at pcib0
isadma0 at isa0
pckbc0 at isa0 port 0x60/5 irq 1 irq 12
pckbd0 at pckbc0 (kbd slot)
wskbd0 at pckbd0: console keyboard, using wsdisplay0
pms0 at pckbc0 (aux slot)
wsmouse0 at pms0 mux 0
pcppi0 at isa0 port 0x61
spkr0 at pcppi0
usb1 at ohci0: USB revision 1.0
uhub1 at usb1 configuration 1 interface 0 "Apple OHCI root hub" rev 1.00/1.00 addr 1
vscsi0 at root
scsibus2 at vscsi0: 256 targets
softraid0 at root
scsibus3 at softraid0: 256 targets
root on wd0a (d6cbe3aebd54fb8e.a) swap on wd0b dump on wd0b
kernel: integer divide fault trap, code=0
Stopped at      ntfs_mountfs+0x62e:     idivl   %ecx,%eax
ddb> trace
ntfs_mountfs() at ntfs_mountfs+0x62e
ntfs_mount() at ntfs_mount+0x21c
sys_mount() at sys_mount+0x271
syscall() at syscall+0x197
--- syscall (number 21) ---
end of kernel
end trace frame: 0x7f7ffffdb701, count: -4
0x1c237090109a:
ddb> show registers
rdi               0xffff8000004f7212
rsi               0xffffffff8173ce27    ntfs_vfsops+0xc7
rbp               0xffff800001e9cad0
rbx                             0x16
rdx                                0
rcx                                0
rax                            0x400    hib_hlt_real+0xfb
r8                0xffffffff81975740    cleancache
r9                                 0
r10                                0
r11                              0x1
r12               0xffffff000078b3b8
r13               0xffff800001e9cb00
r14               0xffff800001e26878
r15               0xffff8000002acc00
rip               0xffffffff811eb71e    ntfs_mountfs+0x62e
cs                               0x8
rflags                       0x10246    __ALIGN_SIZE+0xf246
rsp               0xffff800001e9c9a0
ss                              0x10
ntfs_mountfs+0x62e:     idivl   %ecx,%eax
ddb> ps
   PID     TID   PPID    UID  S       FLAGS  WAIT          COMMAND        
*20819  367534  94672      0  7         0x3                mount_ntfs     
 94672  341993  34016      0  3    0x100083  wait          mount          
 34016  265771  77358      0  3    0x10008b  pause         ksh            
 77358  339410  15195   1000  3    0x10008b  pause         ksh            
 15195  459163  47891   1000  3        0x90  select        sshd           
 47891  128192  95368      0  3        0x92  poll          sshd           
 28745  415257      1      0  3    0x100083  ttyin         getty          
 86217   67248      1      0  3    0x100083  ttyin         getty          
 20203  269701      1      0  3    0x100083  ttyin         getty          
 27058  495423      1      0  3    0x100083  ttyin         getty          
 33865   10494      1      0  3    0x100083  ttyin         getty          
 86610  281757      1      0  3    0x100098  poll          cron           
 74310  397893      1    110  3    0x100090  poll          sndiod         
 17668  354334      1     99  3    0x100090  poll          sndiod         
 59214  385372  81997     95  3    0x100092  kqread        smtpd          
 52376  468460  81997    103  3    0x100092  kqread        smtpd          
 31978  470631  81997     95  3    0x100092  kqread        smtpd          
 50529  321293  81997     95  3    0x100092  kqread        smtpd          
 41845  110778  81997     95  3    0x100092  kqread        smtpd          
 33169   80188  81997     95  3    0x100092  kqread        smtpd          
 81997  168320      1      0  3    0x100080  kqread        smtpd          
 95368  272972      1      0  3        0x80  select        sshd           
  7143   75364  25978     83  3    0x100092  poll          ntpd           
 25978   28125  12975     83  3    0x100092  poll          ntpd           
 12975   94638      1      0  3    0x100080  poll          ntpd           
 12358  423552  80753     74  3    0x100090  bpf           pflogd         
 80753  391781      1      0  3        0x80  netio         pflogd         
 17574   97742  78176     73  3    0x100090  kqread        syslogd        
 78176  237996      1      0  3    0x100082  netio         syslogd        
 86390   20955      1     77  3    0x100090  poll          dhclient       
 51375  521769      1      0  3        0x80  poll          dhclient       
 48270   85271      0      0  3     0x14200  pgzero        zerothread     
 21779  105523      0      0  3     0x14200  aiodoned      aiodoned       
 89070  124813      0      0  3     0x14200  syncer        update         
 84190  175238      0      0  3     0x14200  cleaner       cleaner        
  4775   15512      0      0  3     0x14200  reaper        reaper         
 16186  249675      0      0  3     0x14200  pgdaemon      pagedaemon     
 15699   40982      0      0  3     0x14200  bored         crynlk         
 25242  189440      0      0  3     0x14200  bored         crypto         
 16228   62858      0      0  3     0x14200  pftm          pfpurge        
 78519  212141      0      0  3     0x14200  usbtsk        usbtask        
 80974  492930      0      0  3     0x14200  usbatsk       usbatsk        
 42001   20720      0      0  3  0x40014200  acpi0         acpi0          
 47534  428853      0      0  3     0x14200  bored         softnet        
 22825   17798      0      0  3     0x14200  bored         systqmp        
 88206  186000      0      0  3     0x14200  bored         systq          
 46135  177879      0      0  3  0x40014200  bored         softclock      
 45637  501003      0      0  3  0x40014200                idle0          
     1   44878      0      0  3        0x82  wait          init           
     0       0     -1      0  3     0x10200  scheduler     swapper        
ddb> boot dump
syncing disks... <3>coredump of syslogd(78176), write failed: errno 5
done
WARNING: not updating battery clock

dumping to dev 0,1 offset 1920301
dump 63 62 61 60 59 58 57 56 55 54 53 52 51 50 49 48 47 46 45 44 43 42 41 40 39 38 37 36 35 34 33 32 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 
```
