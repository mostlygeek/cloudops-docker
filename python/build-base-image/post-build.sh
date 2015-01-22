#!/bin/sh

# ref: https://blog.docker.com/2013/06/create-light-weight-docker-containers-buildroot/

# $TARGET_DIR is automatically set by buildroot


# ******************************************
# DOCKER SPECIFIC PATCHES TO THE BUILT 
# ROOTFS
# ******************************************

# Docker sets the DNS configuration by bind-mounting over /etc/resolv.conf.
# This means that /etc/resolv.conf has to be a standard file. By default,
# buildroot makes it a symlink. We have to replace that symlink with a file (an
# empty file will do).

rm "$TARGET_DIR/etc/resolv.conf"
touch "$TARGET_DIR/etc/resolv.conf"

# Docker “injects” itself within containers by bind-mounting over /sbin/init.
# This means that /sbin/init should be a regular file as well. By default,
# buildroot makes it a symlink to busybox
touch "$TARGET_DIR/sbin/init"

# Docker injects itself within containers and it is dynamically linked. This
# means that it requires a couple of libraries to run correctly. We will need
# to add those libraries to the container
cd "$TARGET_DIR/lib"
if [ ! -e libpthread.so.0 ]; then 
    LIB_PTHREAD=$(find . -type f -name "libpthread*" -exec basename '{}' \;)
    ln -s "$LIB_PTHREAD" "libpthread.so.0"
fi

# ******************************************
# Fix up some things so pyrun will work
# ******************************************
cd "$TARGET_DIR/usr/lib"
if [ ! -e libbz2.so.1 ]; then 
    LIB_BZ2=$(find . -type f -name "libbz2.so*" -exec basename '{}' \;)
    ln -s "$LIB_BZ2" "libbz2.so.1"
fi

