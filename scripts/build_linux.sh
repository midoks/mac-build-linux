#! /bin/sh

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")

echo $DIR
mkdir -p $DIR/linux
mkdir -p $DIR/linux/lfs
mkdir -p $DIR/linux/lfs/tools
mkdir -p $DIR/linux/lfs/tools/lib

mkdir -p $DIR/sources

export LFS=$DIR/linux/lfs
export LFS_TGT=$(uname -m)-apple-darwin20

cd $DIR/sources

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


if [ ! -d $LFS/tools/ls ];then
	export CC=${LFS_TGT}-gcc-11
	export CXX=${LFS_TGT}-g++-11
	export NM=${LFS_TGT}-nm-11



	export OBJDUMP=/usr/local/Cellar/binutils/2.37/x86_64-apple-darwin20.4.0/bin/objdump
	# export AR=${LFS_TGT}-gcc-ar-11
	# export RANLIB=${LFS_TGT}-gcc-ranlib-11
	export AR=/usr/local/Cellar/binutils/2.37/x86_64-apple-darwin20.4.0/bin/ar
	export AS=/usr/local/Cellar/binutils/2.37/x86_64-apple-darwin20.4.0/bin/as
	export RANLIB=/usr/local/Cellar/binutils/2.37/x86_64-apple-darwin20.4.0/bin/ranlib


	
	cd $DIR/sources/binutils-2.37
	./configure --prefix=$LFS/tools \
	--with-lib-path=$LFS/tools/lib \
	--disable-nls \
	--disable-werror

	make -j2 && make install
fi
#--------- binutils start ------------------





if [ ! -d /usr/local/Cellar/libelf ];then
	brew install libelf
fi

#--------- linux start ------------------

# LINUX_VER=5.15.12
# cd $DIR/sources
# if [ ! -f $DIR/sources/linux-${LINUX_VER}.tar.xz ];then
# 	wget -O linux-${LINUX_VER}.tar.xz https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${LINUX_VER}.tar.xz
# fi

# if [ ! -d $DIR/sources/linux-${LINUX_VER} ];then
# 	tar -xvf $DIR/sources/linux-${LINUX_VER}.tar.xz
# fi

# cd $DIR/sources/linux-${LINUX_VER}
# make mrproper
# make INSTALL_HDR=dest headers_install

#--------- linux end ------------------