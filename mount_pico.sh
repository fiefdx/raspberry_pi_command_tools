#!/bin/bash
cmd_path=$(dirname $0)
cd $cmd_path

sudo mount -t vfat /dev/sda1 /media/pi/Keyboard -o uid=1000,gid=1000,utf8,dmask=027,fmask=137
