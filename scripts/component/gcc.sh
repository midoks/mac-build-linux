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

	# export LIBS=
	# export CFLAGS=
	export CC=/usr/local/Cellar/gcc/11.2.0/bin/x86_64-apple-darwin20-gcc-11
	export CXX=/usr/local/Cellar/gcc/11.2.0/bin/x86_64-apple-darwin20-g++-11
	export AR=/usr/local/Cellar/gcc/11.2.0/bin/x86_64-apple-darwin20-gcc-ar-11
	export RANLIB=/usr/local/Cellar/gcc/11.2.0/bin/x86_64-apple-darwin20-gcc-ranlib-11

	#--host=x86_64
	cd $DIR/sources/gcc-${VER}
	./configure --prefix=$LFS/tools \
	--enable-languages=C \
	--disable-nls  \
  	--disable-shared \
  	--without-headers \
  	--with-newlib \
  	--disable-decimal-float \
  	--disable-libgomp \
  	--disable-libmudflap \
  	--disable-libssp \
  	--disable-libatomic \
  	--disable-libquadmath \
  	--disable-threads \
  	--enable-languages=c \
  	--disable-multilib

	make -j2 && make install
fi
#--------- binutils start ------------------


