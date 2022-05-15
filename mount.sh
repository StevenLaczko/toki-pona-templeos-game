#!/bin/sh

. ./config.sh

if [ $# -lt 1 ]; then
    echo "Using $1"
    $QEMU_IMG_NAME=$1
fi

set -xe


sudo umount $QEMU_IMG_MOUNT_DIR || true
mkdir -p $QEMU_IMG_MOUNT_DIR
sudo mount -o loop,offset=$QEMU_IMG_MOUNT_OFFSET,rw,uid=`id -u`,gid=`id -g` "$QEMU_IMG_NAME" $QEMU_IMG_MOUNT_DIR
