#!/bin/bash
# Run setup env script & the versions script
source setup.sh
source version.sh

TAR=https://www.zlib.net/zlib-$ZLIB_VER.tar.gz
wget -O $BUILD_DIR/src/zlib.tar.gz $TAR
tar -xf $BUILD_DIR/src/zlib.tar.gz -C $BUILD_DIR/src
