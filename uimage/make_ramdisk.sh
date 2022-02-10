#!/bin/bash

RAMDISK=../rootfs/SYNOJRamdisk.new
UBOOT_RIMAGE=DS107e_Ramdisk.bin


gzip -9 -c $RAMDISK > $RAMDISK.gz

mkimage -n 'synology_powerpc_107e 1157' \
        -A ppc \
        -O linux \
        -T ramdisk \
        -C gzip \
        -a 0x0 \
        -e 0xc \
        -d $RAMDISK.gz \
        $UBOOT_RIMAGE

rm -f $RAMDISK.gz
