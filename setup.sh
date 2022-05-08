#!/bin/bash
export BUILD_DIR=$HOME/mcserveros
export TARGET=aarch64-linux-gnu
export ROOTFS=$BUILD_DIR/final
#Comment out to build for host architecture 
export ARCH=arm64
export JOBS=16
export CROSS_COMPILE=$TARGET-
export CC=$CROSS_COMPILEgcc
#Specifically for openssl see list on openssl site
export TARG=arm64

printf "Build dir is in $BUILD_DIR... \n"
printf "Targeting $TARGET using cross compile \n"
printf "RootFS is in $ROOTFS \n\n\n"
# Create Build dir if it does not exist
if [ ! -d $BUILD_DIR ] ; then
    mkdir -vp $BUILD_DIR
    mkdir $BUILD_DIR/src
    mkdir $ROOTFS
elif [ ! -d $BUILD_DIR/src ] ; then
    mkdir -vp $BUILD_DIR/src
    mkdir $ROOTFS
else 
    mkdir -vp $ROOTFS

fi
