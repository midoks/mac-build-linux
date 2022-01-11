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
export LFS_TGT_LINUX=$(uname -m)-pc-linux-gnu

export LDFLAGS="--static -s"

cd $DIR/sources


#--------- gcc start ------------------
# sh $DIR/scripts/component/gcc.sh
#--------- gcc end ------------------

#--------- binutils start ------------------
bash $DIR/scripts/component/binutils.sh
#--------- binutils start ------------------



#--------- linux start ------------------
# sh $DIR/scripts/component/kernel.sh
#--------- linux end ------------------





