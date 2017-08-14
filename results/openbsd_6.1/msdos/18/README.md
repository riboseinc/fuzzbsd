```
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
cpu0: Intel(R) Core(TM) i7-4850HQ CPU @ 2.30GHz, 2287.99 MHz
cpu0: FPU,VME,DE,PSE,TSC,MSR,PAE,MCE,CX8,APIC,SEP,MTRR,PGE,MCA,CMOV,PAT,PSE36,CFLUSH,MMX,FXSR,SSE,SSE2,SSE3,PCLMUL,MWAIT,SSSE3,CX16,SSE4.1,SSE4.2,MOVBE,POPCNT,AES,XSAVE,AVX,RDRAND,NXE,RDTSCP,LONG,LAHF,ABM,ITSC
cpu0: 256KB 64b/line 8-way L2 cache
cpu0: TSC frequency 2287986610 Hz
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
uvm_fault(0xffffff00036f0d00, 0x88, 0, 1) -> e
kernel: page fault trap, code=0
Stopped at      brelse+0x18:    cmpq    $0,clean_idt+0x68(%rbx)
ddb> trace
brelse() at brelse+0x18
fillinusemap() at fillinusemap+0x1ad
msdosfs_mountfs() at msdosfs_mountfs+0x57b
msdosfs_mount() at msdosfs_mount+0x3bb
sys_mount() at sys_mount+0x271
syscall() at syscall+0x197
--- syscall (number 21) ---
end of kernel
end trace frame: 0x7f7fffff6201, count: -6
0x1ef62a2023aa:
ddb> show registers
rdi                              0x6
rsi                             0x10
rbp               0xffff800001e97a00
rbx                                0
rdx                              0x1
rcx                              0x1
rax                                0
r8                              0x10
r9                                 0
r10                                0
r11                              0x1
r12                                0
r13               0xffff8000ffffc878
r14               0xffff8000002bf000
r15               0xffff8000004f7a00
rip               0xffffffff811cd868    brelse+0x18
cs                               0x8
rflags                       0x10206    __ALIGN_SIZE+0xf206
rsp               0xffff800001e979e0
ss                              0x10
brelse+0x18:    cmpq    $0,clean_idt+0x68(%rbx)
ddb> ps
   PID     TID   PPID    UID  S       FLAGS  WAIT          COMMAND        
*35908  432900  98082      0  7         0x3                mount_msdos    
 98082  231066  26437      0  3    0x100083  wait          mount          
 68983  178102   8384      0  3    0x100083  ttyin         ksh            
  8384   20582   4834   1000  3    0x10008b  pause         ksh            
  4834  509966  17405   1000  3        0x90  select        sshd           
 17405  408316  14556      0  3        0x92  poll          sshd           
  8715  341734      1      0  3    0x100083  ttyin         getty          
 92841  486185      1      0  3    0x100083  ttyin         getty          
 54519  136354      1      0  3    0x100083  ttyin         getty          
 71313  135918      1      0  3    0x100083  ttyin         getty          
 26437   33646      1      0  3    0x10008b  pause         ksh            
 36952  233996      1      0  3    0x100098  poll          cron           
 12148  504857      1    110  3    0x100090  poll          sndiod         
 60515   85396      1     99  3    0x100090  poll          sndiod         
 34586  410920  41189     95  3    0x100092  kqread        smtpd          
 70811   51410  41189    103  3    0x100092  kqread        smtpd          
  4984  207761  41189     95  3    0x100092  kqread        smtpd          
 87906  123833  41189     95  3    0x100092  kqread        smtpd          
 20710  442091  41189     95  3    0x100092  kqread        smtpd          
 26847   95335  41189     95  3    0x100092  kqread        smtpd          
 41189  195533      1      0  3    0x100080  kqread        smtpd          
 14556  496776      1      0  3        0x80  select        sshd           
 39537  113648  50598     83  3    0x100092  poll          ntpd           
 50598  320290  27958     83  3    0x100092  poll          ntpd           
 27958   29028      1      0  3    0x100080  poll          ntpd           
 21634  416889   8602     74  3    0x100090  bpf           pflogd         
  8602    6317      1      0  3        0x80  netio         pflogd         
 77786  108986  56773     73  2    0x100090                syslogd        
 56773  154906      1      0  3    0x100082  netio         syslogd        
 78989  437865      1     77  3    0x100090  poll          dhclient       
  2115  390838      1      0  3        0x80  poll          dhclient       
 53568  330362      0      0  3     0x14200  pgzero        zerothread     
 73946  274460      0      0  3     0x14200  aiodoned      aiodoned       
 62515  204834      0      0  3     0x14200  syncer        update         
 50446   33802      0      0  3     0x14200  cleaner       cleaner        
 49469   70537      0      0  3     0x14200  reaper        reaper         
 29888  373042      0      0  3     0x14200  pgdaemon      pagedaemon     
 63716  380579      0      0  3     0x14200  bored         crynlk         
 41825  252213      0      0  3     0x14200  bored         crypto         
 60634  443824      0      0  3     0x14200  pftm          pfpurge        
 22752  318366      0      0  3     0x14200  usbtsk        usbtask        
 16062  157239      0      0  3     0x14200  usbatsk       usbatsk        
 62357   85121      0      0  3  0x40014200  acpi0         acpi0          
 10316  135764      0      0  3     0x14200  bored         softnet        
 33669  174114      0      0  3     0x14200  bored         systqmp        
 74917  298490      0      0  3     0x14200  bored         systq          
 70007  373197      0      0  3  0x40014200  bored         softclock      
 99640  100340      0      0  3  0x40014200                idle0          
     1  341549      0      0  3        0x82  wait          init           
     0       0     -1      0  3     0x10200  scheduler     swapper        
ddb> boot dump
syncing disks... done
WARNING: not updating battery clock

dumping to dev 0,1 offset 1920301
dump 63 62 61 60 59 58 57 56 55 54 53 52 51 50 49 48 47 46 45 44 43 42 41 40 39 38 37 36 35 34 33 32 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 
```
