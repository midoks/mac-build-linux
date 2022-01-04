#! /bin/sh

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")

echo $DIR
mkdir -p $DIR/linux
mkdir -p $DIR/linux/lfs
mkdir -p $DIR/linux/lfs/tools

mkdir -p $DIR/sources

export LFS=$DIR/linux/lfs

if [ ! -d /usr/local/Cellar/binutils ];then
	brew install binutils
fi

if [ ! -d /usr/local/Cellar/libelf ];then
	brew install libelf
fi

#--------- linux start ------------------

LINUX_VER=5.15.12
cd $DIR/sources
if [ ! -f $DIR/sources/linux-${LINUX_VER}.tar.xz ];then
	wget -O linux-${LINUX_VER}.tar.xz https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${LINUX_VER}.tar.xz
fi

if [ ! -d $DIR/sources/linux-${LINUX_VER} ];then
	tar -xvf $DIR/sources/linux-${LINUX_VER}.tar.xz
fi

cd $DIR/sources/linux-${LINUX_VER}
make mrproper
make INSTALL_HDR=dest headers_install

#--------- linux end ------------------