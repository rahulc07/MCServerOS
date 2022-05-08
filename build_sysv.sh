#!/bin/bash
source setup.sh
source version.sh

cd $BUILD_DIR/src/sysvinit-$SYSV_VER

CC=$CROSS_COMPILEgcc make -j$JOBS

cd src
rm *.o *.h *.c Makefile
cp * $ROOTFS/usr/bin

#Breaks host highly not recommended 
