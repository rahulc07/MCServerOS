#!/bin/bash
# Run setup env script & the versions script
source setup.sh
source version.sh

TAR=https://www.nano-editor.org/dist/v6/nano-$NANO_VER.tar.xz
wget -O $BUILD_DIR/src/nano.tar.xz $TAR
tar -xf $BUILD_DIR/src/nano.tar.xz -C $BUILD_DIR/src
