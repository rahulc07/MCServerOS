#!/bin/bash
# Run setup env script & the versions script
source setup.sh
source version.sh

TAR=https://ftp.osuosl.org/pub/blfs/conglomeration/shadow/shadow-$SHADOW_VER.tar.xz
wget -O $BUILD_DIR/src/shadow.tar.xz $TAR
tar -xf $BUILD_DIR/src/shadow.tar.xz -C $BUILD_DIR/src
