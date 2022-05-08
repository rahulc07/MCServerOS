#!/bin/bash
#Run Version and Setup script
source version.sh
source setup.sh

cd $BUILD_DIR/src/linux-$KERN_VER

#Make default config 
make defconfig
make -j$JOBS

#Install 
echo "Starting Install Process for Kernel, this might go very wrong make sure you are not running as root"
make INSTALL_HDR_PATH=$BUILD_DIR/final/usr headers_install
make INSTALL_MOD_PATH=$BUILD_DIR/final/usr modules_install
