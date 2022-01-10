#! /bin/sh

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")

export LFS=$DIR/linux/lfs
export LFS_TGT=$(uname -m)-apple-darwin20
export LFS_TGT_LINUX=$(uname -m)-pc-linux-gnu


LINUX_VER=5.15.12
if [ ! -f $DIR/sources/linux-${LINUX_VER}.tar.xz ];then
	wget -O linux-${LINUX_VER}.tar.xz https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${LINUX_VER}.tar.xz
fi

if [ ! -d $DIR/sources/linux-${LINUX_VER} ];then
	tar -xvf $DIR/sources/linux-${LINUX_VER}.tar.xz
fi


cat <<EOT >> /usr/local/include/elf.h
#include "gelf.h"
#define R_386_NONE 0
#define R_386_32 1
#define R_386_PC32 2
#define R_ARM_NONE 0
#define R_ARM_PC24 1
#define R_ARM_ABS32 2
#define R_MIPS_NONE 0
#define R_MIPS_16 1
#define R_MIPS_32 2
#define R_MIPS_REL32 3
#define R_MIPS_26 4
#define R_MIPS_HI16 5
#define R_MIPS_LO16 6
#define R_IA64_IMM64 0x23 /* symbol + addend, mov imm64 */
#define R_PPC_ADDR32 1 /* 32bit absolute address */
#define R_PPC64_ADDR64 38 /* doubleword64 S + A */
#define R_SH_DIR32 1
#define R_SPARC_64 32 /* Direct 64 bit */
#define R_X86_64_64 1 /* Direct 64 bit */
#define R_390_32 4 /* Direct 32 bit. */
#define R_390_64 22 /* Direct 64 bit. */
#define R_MIPS_64 18
EOT

cd $DIR/sources/linux-${LINUX_VER}
make mrproper
make INSTALL_HDR=dest headers_install

#--------- kernel start ------------------


