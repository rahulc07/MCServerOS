#!/bin/bash
#Run Version and Setup script
source version.sh
source setup.sh

cd $BUILD_DIR/src/nano-$NANO_VER


#Add include dirs into path
echo $ROOTFS
sleep 3
export CFLAGS="-I$ROOTFS/usr/include"
export CXXFLAGS="-I$ROOTFS/usr/include"
export CPPFLAGS="-I$ROOTFS/usr/include"
echo $CFLAGS
export LD_LIBRARY_PATH="$ROOTFS/usr/lib"

#Copy Ncurses libraries to host so that ld can find them
echo "Copying Ncurses libs to host this will not work without sudo"
sudo cp -n $ROOTFS/usr/lib/libncu* /usr/$TARGET/lib

#Configure
./configure \
 --prefix=/usr \
 --host=$TARGET \
 --target=$TARGET \
 --build=x86_64-linux-gnu \
 --enable-utf8 \
 --disable-nls \
 --enable-color \
 --enable-extra \
 --enable-multibuffer \
 --enable-nanorc \
 --disable-libmagic \

make -j$JOBS

#Install 
echo "Starting Install Process for Ncurses"
make DESTDIR=$ROOTFS install
