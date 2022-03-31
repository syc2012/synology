#!/bin/bash

RAMDISK_GZ=../rootfs/SYNOJRamdisk.new.gz
UBOOT_RIMAGE=DS107e_Ramdisk.bin

mkimage -n 'synology_powerpc_107e 1157' \
        -A ppc \
        -O linux \
        -T ramdisk \
        -C gzip \
        -a 0x0 \
        -e 0xc \
        -d $RAMDISK_GZ \
        $UBOOT_RIMAGE
