#!/bin/bash
# Run setup env script & the versions script
source setup.sh
source version.sh

TAR=https://ftp.gnu.org/gnu/glibc/glibc-$LIBC_VER.tar.xz
wget -O $BUILD_DIR/src/glibc.tar.xz $TAR
tar -xf $BUILD_DIR/src/glibc.tar.xz -C $BUILD_DIR/src

