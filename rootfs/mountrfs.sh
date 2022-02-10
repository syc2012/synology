#!/bin/bash

RAMDISK=SYNOJRamdisk.new

mkdir -p root
sudo mount -o loop $RAMDISK root
ls -l root
