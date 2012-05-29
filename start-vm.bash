#!env bash

[[ -z $1 ]] && echo "$0 <hda> <ram> <iso>" && exit 0
qemu-system-x86_64 -enable-kvm -hda images/$1.img -localtime -soundhw ac97 -alt-grab -usb -m $2 -cdrom $3
