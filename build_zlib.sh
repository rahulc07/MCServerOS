#!/bin/bash

#Config and Setup
source setup.sh
source version.sh

#Change Dir
cd $BUILD_DIR/src/zlib-$ZLIB_VER

# Configure 
CHOST=$ARCH AR=$TARGET-ar CC=$CROSS_COMPILEgcc ./configure \
  --prefix=$ROOTFS/usr \

#Make
make -j$JOBS

#Install 
make install
