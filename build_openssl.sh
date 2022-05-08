#!/bin/bash
#Source
source setup.sh
source version.sh

#Change Dir
cd $BUILD_DIR/src/openssl-$SSL_VER

#ENV
#export CC=$TARGET-gcc 
#export AR=$TARGET-ar
export CFLAGS=-I$ROOTFS/usr/include

#Configure 
./Configure linux-$TARG --prefix=$ROOTFS/usr --openssldir=$ROOTFS/usr/openssl shared zlib-dynamic

#Make
make -j$JOBS

#Install
make install
