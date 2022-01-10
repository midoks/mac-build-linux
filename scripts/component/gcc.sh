#! /bin/sh

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")

export LFS=$DIR/linux/lfs
export LFS_TGT=$(uname -m)-apple-darwin20
export LFS_TGT_LINUX=$(uname -m)-pc-linux-gnu


VER=11.2.0
if [ ! -f $DIR/sources/gcc-${VER}.tar.xz ];then
	wget -O gcc-${VER}.tar.xz https://gnu.mirror.constant.com/gcc/gcc-${VER}/gcc-${VER}.tar.xz
fi

if [ ! -d $DIR/sources/gcc-${VER} ];then
	tar -xvf $DIR/sources/gcc-${VER}.tar.xz
fi


# x86_64-elf-binutils
# arm-elf-gcc
# x86_64-elf-gcc
if [ ! -d $LFS/tools/gcc ];then

	export LIBS=
	export CFLAGS=

	#--host=x86_64
	cd $DIR/sources/gcc-${VER}
	./configure --prefix=$LFS/tools \
	--target=$LFS_TGT_LINUX

	make -j2 && make install
fi
#--------- binutils start ------------------


