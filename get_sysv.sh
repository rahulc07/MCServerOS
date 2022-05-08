#!/bin/bash
# Run setup env script & the versions script
source setup.sh
source version.sh

TAR=https://download.savannah.gnu.org/releases/sysvinit/sysvinit-$SYSV_VER.tar.xz
wget -O $BUILD_DIR/src/sysv.tar.xz $TAR
tar -xf $BUILD_DIR/src/sysv.tar.xz -C $BUILD_DIR/src
