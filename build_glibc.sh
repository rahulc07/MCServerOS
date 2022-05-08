#!/bin/bash

#Run Version and Setup script
source setup.sh
source version.sh

cd $ROOTFS
ln -s usr/bin bin
ln -s usr/sbin sbin
ln -s usr/lib lib
ln -s usr/lib lib64
mkdir -v dev sys proc run


cd $BUILD_DIR/src/glibc-$LIBC_VER
mkdir -p build
cd build
#Run configure script with headers
 ../configure \
 --prefix=/usr \
 --with-headers=$ROOTFS/usr/include \
 --disable-werror \
 --without-selinux \
 --without-gd \
 --host=$TARGET \
 --target=$TARGET \
 --build=x86_64-linux-gnu \
 libc_cv_slibdir=/usr/lib 

echo "Configure Done"
sleep 2 
echo "Building"
make -j$JOBS 
make DESTDIR=$ROOTFS install
