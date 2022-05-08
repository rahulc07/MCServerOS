#!/bin/bash
# Run setup env script & the versions script
source setup.sh
source version.sh

TAR=https://ftp.gnu.org/gnu/ncurses/ncurses-$NCURSES_VER.tar.gz
wget -O $BUILD_DIR/src/ncurses.tar.gz $TAR
tar -xf $BUILD_DIR/src/ncurses.tar.gz -C $BUILD_DIR/src
