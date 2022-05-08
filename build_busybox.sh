#!/bin/bash
#Run Version and Setup script
source version.sh
source setup.sh

cd $BUILD_DIR/src/busybox-$BUSYBOX_VER

#Make default config 
echo $ARCH
make defconfig
sed -i 's/# CONFIG_STATIC is not set/CONFIG_STATIC=y/' .config
make -j$JOBS

#Install 
echo "Starting Install Process for busybox"
cp busybox $ROOTFS/usr/bin
cd $ROOTFS/usr/bin
for prog in $(busybox --list); do
  ln -s /bin/busybox ./$prog
done
cp $BUILD_DIR/src/busybox-$BUSYBOX_VER/busybox $ROOTFS/usr/bin
