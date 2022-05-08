#!/bin/bash

#Env
source setup.sh
source version.sh

#Change dir
cd $BUILD_DIR/src/openssh-$SSH_VER

#Cflags
CFLAGS=-I$ROOTFS/usr/include

#Copy zlib & openssl from target to host

sudo cp -n $ROOTFS/usr/include/zlib.h /usr/$TARGET/include
sudo cp -n $ROOTFS/usr/include/zconf.h /usr/$TARGET/include
sudo cp -n $ROOTFS/usr/lib/libz* /usr/$TARGET/lib
sudo cp -n $ROOTFS/usr/lib/libcrypto* /usr/$TARGET/lib

#Configure 
./configure --prefix=/usr                            \
            --sysconfdir=/etc/ssh                    \
            --with-privsep-path=/var/lib/sshd        \
            --with-default-path=/usr/bin             \
            --with-superuser-path=/usr/sbin:/usr/bin \
            --with-pid-dir=/run           \
            --host=$TARGET \
            --target=$TARGET \
            --with-zlib=$ROOTFS/usr/include \
            --disable-strip

#Compile
make -j$JOBS

#Install 
make DESTDIR=$ROOTFS install

#Generate Fresh Host Keys
mkdir -p $ROOTFS/etc/ssh/
ssh-keygen -q -N "" -t rsa -b 4096 -f $ROOTFS/etc/ssh/ssh_host_rsa_key
