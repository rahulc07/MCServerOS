#!/bin/bash
source setup.sh
cd $BUILD_DIR/src
wget https://download.oracle.com/java/17/latest/jdk-17_linux-aarch64_bin.tar.gz
tar -xvf jdk-17_linux-aarch64_bin.tar.gz
cd $BUILD_DIR/src/jdk-17.0.3
cd bin
cp -r * $ROOTFS/bin
cd ../lib
cp -r * $ROOTFS/lib

