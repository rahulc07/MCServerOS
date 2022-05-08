#!/bin/bash
#Run Version and Setup script
source version.sh
source setup.sh

cd $BUILD_DIR/src/ncurses-$NCURSES_VER

#Make default config 
./configure \
 --prefix=/usr \
 --host=$TARGET \
 --target=$TARGET \
 --build=x86_64-linux-gnu \
 --with-shared \
 --without-manpages \
 --without-normal \
 --without-progs \
 --without-debug \
 --enable-widec \
 --disable-stripping \

make -j$JOBS

#Install 
echo "Starting Install Process for Ncurses"
make DESTDIR=$ROOTFS install
