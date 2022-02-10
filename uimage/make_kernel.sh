#!/bin/bash

KERNEL=../kernel/SYNOJKernel.new
UBOOT_KIMAGE=DS107e_Kernel.bin


mkimage -n 'Linux 2.4.22 1157' \
        -A ppc \
        -O linux \
        -T kernel \
        -C gzip \
        -a 0x0 \
        -e 0xc \
        -d $KERNEL \
        $UBOOT_KIMAGE

rm -f $KERNEL.gz
