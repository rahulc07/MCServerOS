#!/bin/bash
# Run setup env script & the versions script
source setup.sh
source version.sh

TAR=https://www.openssl.org/source/openssl-$SSL_VER.tar.gz
wget -O $BUILD_DIR/src/openssl.tar.gz $TAR
tar -xf $BUILD_DIR/src/openssl.tar.gz -C $BUILD_DIR/src
