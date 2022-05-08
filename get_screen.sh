#!/bin/bash
# Run setup env script & the versions script
source setup.sh
source version.sh

TAR=https://ftp.gnu.org/gnu/screen/screen-$SCREEN_VER.tar.gz
wget -O $BUILD_DIR/src/screen.tar.gz $TAR
tar -xf $BUILD_DIR/src/screen.tar.gz -C $BUILD_DIR/src
