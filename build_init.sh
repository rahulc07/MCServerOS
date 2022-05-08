#!/bin/bash

source setup.sh

rm $ROOTFS/init
touch $ROOTFS/init
echo "#!/bin/sh" >> $ROOTFS/init
echo "mount -t devtmpfs udev /dev" >> $ROOTFS/init
echo "mount -t sysfs sysfs /sys" >> $ROOTFS/init
echo "mount -t proc proc /proc" >> $ROOTFS/init
echo "mkdir -p /dev/pts" >> $ROOTFS/init
echo "mount -t devpts devpts /dev/pts" >> $ROOTFS/init
echo "hostname embed" >> $ROOTFS/init
echo "cd /etc/ssh" >> $ROOTFS/init
echo "sleep 1" >> $ROOTFS/init
echo "ifup eth0" >> $ROOTFS/init
echo "sleep 1" >> $ROOTFS/init
echo "/bin/init 1" >> $ROOTFS/init
echo "/etc/init.d/sshd start" >> $ROOTFS/init
echo "while true" >> $ROOTFS/init
echo "do" >> $ROOTFS/init
echo "    bash -c "login"" >> $ROOTFS/init
echo done >> $ROOTFS/init


chmod +x $ROOTFS/init
