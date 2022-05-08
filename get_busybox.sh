#!/bin/bash
# Run setup env script & the versions script
source setup.sh
source version.sh

TAR=https://busybox.net/downloads/busybox-$BUSYBOX_VER.tar.bz2
wget -O $BUILD_DIR/src/busybox.tar.xz $TAR
tar -xf $BUILD_DIR/src/busybox.tar.xz -C $BUILD_DIR/src
