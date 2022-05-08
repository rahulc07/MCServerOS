#!/bin/bash
# Run setup env script & the versions script
source setup.sh
source version.sh

TAR=https://ftp.wayne.edu/gnu/bash/bash-$BASH_VER.tar.gz
wget -O $BUILD_DIR/src/bash.tar.xz $TAR
tar -xf $BUILD_DIR/src/bash.tar.xz -C $BUILD_DIR/src
