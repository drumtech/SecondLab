#!/bin/bash
mkdir -p ~root/.ssh
cp ~vagrant/.ssh/auth* ~root/.ssh
yum install -y mdadm smartmontools hdparm gdisk
mdadm --zero-superblock /dev/sd{b,c,d,e,f,g}
mdadm --create /dev/md0 --level=5 --raid-devices=6 /dev/sd{b,c,d,e,f,g}
mkfs.ext4 /dev/md0
