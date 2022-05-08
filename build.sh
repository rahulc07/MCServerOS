#!/bin/bash
source setup.sh
source version.sh

echo "Building for $ARCH with $TARGET toolchain"
echo "Make sure you have these toolchains installed or the install will error out"
echo ""
echo "Busybox Version = $BUSYBOX_VER"
echo "Kernel Version = $KERN_VER"
echo "Glibc Version = $LIBC_VER"

echo "3 second warning before compile starts, if something looks wrong Ctrl+c out NOW!"
sleep 3

echo "Starting Kernel Compile"
bash get_kernel.sh
bash build_kernel.sh
sleep 3

echo "Starting libc compile"
bash get_glibc.sh
bash build_glibc.sh
sleep 3

echo "Starting Busybox compile"
bash get_busybox.sh
bash build_busybox.sh
sleep 3

echo "Starting NCURSES Compile"
bash get_ncurses.sh
bash build_ncurses.sh
sleep 3

echo "Starting Nano Compile"
bash get_nano.sh
bash build_nano.sh

echo "Starting Bash Compile"
bash get_bash.sh
bash build_bash.sh

echo "Starting Shadow Compile"
bash get_shadow.sh
bash build_shadow.sh

echo "Starting ZLIB Compile"
bash get_zlib.sh
bash build_zlib.sh

echo "Starting OpenSSL Compile"
bash get_openssl.sh
bash build_openssl.sh

echo "Starting OpenSSH Compile"
bash get_ssh.sh
bash build_ssh.sh

echo "Starting Bootscripts Compile"
bash get_bootscripts.sh
bash build_bootscripts.sh

echo "SYSV Init"
bash get_sysv.sh
bash build_sysv.sh

echo "Java"
bash java17.sh


echo "making init"
bash build_init.sh

