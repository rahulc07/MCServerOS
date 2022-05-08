#!/bin/bash
# Run setup env script & the versions script
source setup.sh
source version.sh

TAR=https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-$SSH_VER.tar.gz
wget -O $BUILD_DIR/src/ssh.tar.xz $TAR
tar -xf $BUILD_DIR/src/ssh.tar.xz -C $BUILD_DIR/src
