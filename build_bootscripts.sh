#!/bin/bash
#From LFS

source setup.sh

cd $BUILD_DIR/src/lfs-bootscripts-20220327
make DESTDIR=$ROOTFS install 

cat > $ROOTFS/etc/passwd << "EOF"
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/dev/null:/bin/false
daemon:x:6:6:Daemon User:/dev/null:/bin/false
messagebus:x:18:18:D-Bus Message Daemon User:/run/dbus:/bin/false
uuidd:x:80:80:UUID Generation Daemon User:/dev/null:/bin/false
nobody:x:99:99:Unprivileged User:/dev/null:/bin/false
sshd:x:50:50:sshd PrivSep:/var/lib/sshd:/bin/false
EOF

cat > $ROOTFS/etc/group << "EOF"
root:x:0:
bin:x:1:daemon
sys:x:2:
kmem:x:3:
tape:x:4:
tty:x:5:
daemon:x:6:
floppy:x:7:
disk:x:8:
lp:x:9:
dialout:x:10:
audio:x:11:
video:x:12:
utmp:x:13:
usb:x:14:
cdrom:x:15:
adm:x:16:
messagebus:x:18:
input:x:24:
mail:x:34:
kvm:x:61:
uuidd:x:80:
wheel:x:97:
nogroup:x:99:
sshd:x:50:
users:x:999:
EOF

#Internet
mkdir -p $ROOTFS/etc/sysconfig
cd $ROOTFS/etc/sysconfig 
cat > ifconfig.eth0 << "EOF"
ONBOOT=yes
IFACE=eth0
SERVICE=ipv4-static
IP=192.168.1.29
GATEWAY=192.168.1.1
PREFIX=24
BROADCAST=192.168.1.255
EOF




wget  https://anduin.linuxfromscratch.org/BLFS/blfs-bootscripts/blfs-bootscripts-20210826.tar.xz
tar -xvf blfs-bootscripts-20210826.tar.xz
cd blfs-bootscripts-20210826
make DESTDIR=$ROOTFS install-sshd
