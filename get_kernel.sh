#!/bin/bash
# Run setup env script & the versions script
source setup.sh
source version.sh

TAR=https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-$KERN_VER.tar.xz
wget -O $BUILD_DIR/src/kern.tar.xz $TAR
echo "Extracting Kernel this might take a while"
tar -xf $BUILD_DIR/src/kern.tar.xz -C $BUILD_DIR/src
