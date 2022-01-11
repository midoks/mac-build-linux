#! /bin/zsh

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")

export LC_ALL=C


#--------- binutils start ------------------
if [ ! -d /usr/local/Cellar/binutils ];then
	brew install binutils
fi

if [ ! -d /usr/local/Cellar/binutils ];then
	brew install binutils
fi


if [ ! -f $DIR/sources/binutils-2.37.tar.xz ];then
	wget -O binutils-2.37.tar.xz https://gnu.mirror.constant.com/binutils/binutils-2.37.tar.xz
fi

if [ ! -d $DIR/sources/binutils-2.37 ];then
	tar -xvf $DIR/sources/binutils-2.37.tar.xz
fi


# x86_64-elf-binutils
# arm-elf-gcc
# x86_64-elf-gcc
if [ ! -d $LFS/tools/ls ];then
	# export CC=${LFS_TGT}-gcc-11
	# export CC=${LFS_TGT}-gcc-11
	# export CXX=${LFS_TGT}-g++-11
	# export NM=${LFS_TGT}-nm-11

	# export CC=gcc
	# export CXX=g++
	# export AR=/usr/local/Cellar/binutils/2.37/x86_64-apple-darwin20.4.0/bin/ar
	# export AS=/usr/local/Cellar/binutils/2.37/x86_64-apple-darwin20.4.0/bin/as
	# export RANLIB=/usr/local/Cellar/binutils/2.37/x86_64-apple-darwin20.4.0/bin/ranlib


	export CC=/usr/local/Cellar/gcc/11.2.0/bin/x86_64-apple-darwin20-gcc-11
	export CXX=/usr/local/Cellar/gcc/11.2.0/bin/x86_64-apple-darwin20-g++-11
	export AR=/usr/local/Cellar/gcc/11.2.0/bin/x86_64-apple-darwin20-gcc-ar-11
	export RANLIB=/usr/local/Cellar/gcc/11.2.0/bin/x86_64-apple-darwin20-gcc-ranlib-11

	# cross 

	# export LIBS=
	# export CFLAGS=

	# export CC=/usr/local/Cellar/x86_64-elf-gcc/11.2.0/bin/x86_64-elf-gcc
	# export CXX=/usr/local/Cellar/x86_64-elf-gcc/11.2.0/bin/x86_64-elf-g++
	# export AR=/usr/local/Cellar/x86_64-elf-gcc/11.2.0/bin/x86_64-elf-gcc-ar
	# export RANLIB=/usr/local/Cellar/x86_64-elf-gcc/11.2.0/bin/x86_64-elf-gcc-randlib

	
	#--host=x86_64
	cd $DIR/sources/binutils-2.37
	./configure --prefix=$LFS/tools \
	--target=x86_64 \
	--with-system-zlib

	# make -j2 && make install
fi
#--------- binutils start ------------------
