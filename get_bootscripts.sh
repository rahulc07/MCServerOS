#!/bin/bash

#Straight from the Linux from Scratch projects, internet wouldn't be possible without these.
# Thanks LFS contributors 

#Env

source setup.sh

#No version nessacery

#Get
cd $BUILD_DIR/src
wget https://www.linuxfromscratch.org/lfs/downloads/development/lfs-bootscripts-20220327.tar.xz
tar -xvf lfs-bootscripts-20220327.tar.xz -C "$BUILD_DIR/src"
