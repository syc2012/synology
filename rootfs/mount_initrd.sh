#!/bin/bash

RAMDISK=SYNOJRamdisk.new

mkdir -p root
sudo mount -o loop -t ext2 $RAMDISK root
ls -l root
