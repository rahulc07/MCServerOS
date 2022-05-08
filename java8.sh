#!/bin/bash
source setup.sh
cd $BUILD_DIR/src/jdk-8u321-$TARG
cd bin
cp * $ROOTFS/bin
cd ../lib
cp * $ROOTFS/lib

