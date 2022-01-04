#! /bin/sh

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")

echo $DIR
mkdir -p $DIR/linux
mkdir -p $DIR/linux/tools
mkdir -p $DIR/linux/lfs

export LFS=$DIR/linux/lfs


cd $DIR/sources/binutils-2.37
./configure --prefix=$DIR/linux/tools \
--with-sysroot=$LFS \
--with-lib-path=$DIR/linux/tools/lib \
--target=$LFS_TGT \
--disable-nls \
--disable-werror