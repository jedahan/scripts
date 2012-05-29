#!env bash

echo "create <name> <size>"
qemu-img create -f qcow2 images/$1.img $2
