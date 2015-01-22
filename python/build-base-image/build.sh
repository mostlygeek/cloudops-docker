#!/bin/sh

BASE=$(realpath $(dirname $0))
VERSION=buildroot-2014.11
ARCHIVE="${VERSION}.tar.bz2"
WORKDIR="$BASE/WORK"

if [ ! -d $WORKDIR ]; then 
    mkdir $WORKDIR
fi

cd $WORKDIR

if [ ! -e $ARCHIVE ]; then
    curl -O "http://buildroot.org/downloads/$ARCHIVE"
fi

if [ ! -d $VERSION ]; then
    tar jxvf $ARCHIVE
fi

cp $BASE/buildroot-glibc-config $WORKDIR/$VERSION/.config

echo "To Build: "
echo
echo "1. cd WORK/$VERSION; make"
echo "2. (as root) docker import - cloudops:base_pyrun < output/images/rootfs.tar"
echo
