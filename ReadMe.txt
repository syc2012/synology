[ DS107e ]

Flash memory
  AMD S29AL016M (16M bits, 2M bytes)

FFE0_0000 - FFEC_FFFF : zImage  : 832KB
FFED_0000 - FFED_FFFF : vendor  :  64KB
FFEE_0000 - FFEF_FFFF : x       : 128KB
FFF0_0000 - FFF3_FFFF : ppcboot : 256KB
FFF4_0000 - FFFE_FFFF : rd.gz   : 704KB
FFFF_0000 - FFFF_FFFF : x       :  64KB


[ Kernel ]

setenv serverip 192.168.2.2
setenv ipaddr 192.168.2.88
protect off all
mw.b 1000000 ff d0000
tftpboot 1000000 DS107e_Kernel.bin
erase ffe00000 ffecffff
cp.b 1000000 ffe00000 d0000
protect on all


[ RAM Disk ]

setenv serverip 192.168.2.2
setenv ipaddr 192.168.2.88
protect off all
mw.b 1000000 ff b0000
tftpboot 1000000 DS107e_Ramdisk.bin
erase fff40000 fffeffff
cp.b 1000000 fff40000 b0000
protect on all
