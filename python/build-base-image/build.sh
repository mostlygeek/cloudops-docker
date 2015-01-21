#!/bin/sh

BASE=$(dirname $0)
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

