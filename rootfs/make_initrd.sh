#!/bin/bash

RAMDISK=SYNOJRamdisk.new
ROOTFS_TGZ=root_DS107e.tgz

dd if=/dev/zero of=$RAMDISK bs=1k count=8192
sudo mke2fs -F -m 0 -i 2000 $RAMDISK
sudo tune2fs -c 0 $RAMDISK

sleep 1

mkdir -p root
sudo mount -o loop -t ext2 $RAMDISK root
sudo tar xzf $ROOTFS_TGZ -C root/
sudo cp -f patch/etc/* root/etc/
sync

sudo umount root

gzip -9 -c $RAMDISK > $RAMDISK.gz
