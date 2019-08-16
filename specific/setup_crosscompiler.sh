#!/bin/bash
#
# Compiles and installs our cross compiler.
#
# Run as ROOT.

# check for root
if [ "$EUID" -ne 0 ]
then
    echo "Run as ROOT."
    exit
fi

# install dependencies
apt install -y libgmp3-dev libmpc-dev libmpfr-dev libncurses5-dev

# find current gcc and ld
export CC=`which gcc`
export LD=`which ld`

# target directory to build to
export PREFIX="/usr/local/i386elfgcc"
export TARGET=i386-elf

# set up directories
mkdir tmp
mkdir tmp/src
cd tmp/src

# install binutils
curl -O http://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.gz
tar xf binutils-2.24.tar.gz
rm binutils-2.24.tar.gz
mkdir binutils-build
cd binutils-build
../binutils-2.24/configure --target=$TARGET --enable-interwork --enable-multilib --disable-nls --disable-werror --prefix=$PREFIX
make all install
cd ..

# install gcc
curl -O https://ftp.gnu.org/gnu/gcc/gcc-4.9.1/gcc-4.9.1.tar.bz2
tar xf gcc-4.9.1.tar.bz2
rm gcc-4.9.1.tar.bz2
mkdir gcc-build
cd gcc-build
../gcc-4.9.1/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --disable-libssp --enable-languages=c --without-headers
make all-gcc
make all-target-libgcc
make install-gcc
make install-target-libgcc

# install gdb
curl -O http://ftp.rediris.es/mirror/GNU/gdb/gdb-7.8.tar.gz
tar xf gdb-7.8.tar.gz
rm gdb-7.8.tar.gz
mkdir gdb-build
cd gdb-build
../gdb-7.8/configure --target="$TARGET" --prefix="$PREFIX" --program-prefix=i386-elf-
make
make install

# leave and destroy directories
cd ../../..
rm -rf tmp
