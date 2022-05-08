#!/bin/bash

#Source/Setup 
source version.sh
source setup.sh

#Change directory 
cd $BUILD_DIR/src/screen-$SCREEN_VER

#Copy libs 
sudo cp -n $ROOTFS/usr/lib/libncu* /usr/$TARGET/lib

#Configure 
sh autogen.sh
./configure --prefix=/usr                     \
            --infodir=/usr/share/info         \
            --mandir=/usr/share/man           \
            --with-socket-dir=/run/screen     \
            --with-pty-group=5                \
            --with-sys-screenrc=/etc/screenrc \
            --host=$TARGET
sed -i -e "s%/usr/local/etc/screenrc%/etc/screenrc%" {etc,doc}/*

#Compile 
make -j$JOBS
#Install
make DESTDIR=$ROOTFS install
install -m 644 etc/etcscreenrc $ROOTFS/etc/screenrc
























#echo "root:$6$iV7r2ksJI5yTLXt3$EQ8jJQOoMrpAIBpyJVXS1InvkWSjrVyh028WpwbfjL/XNhOJ0kXJh61KWDYfpxh8y6DEqTGCDyULIvQ/ODjlq.:18894::::::" > $ROOTFS/etc/shadow
