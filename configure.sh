#!/bin/bash

ARCH="-Rpass-missed=loop-vectorize -Rpass-analysis=loop-vectorize -Wl,-hugetlbfs-align -ffast-math"
extracflags="-D_REENTRANT -falign-functions=16 -fomit-frame-pointer -fpic -pthread -flto -fuse-ld=lld -fvariable-expansion-in-unroller"
March= "-march=armv8-a+crypto+sha2+crc"
CORE="-mtune=cortex-a73 -mtune=cortex-a53"
OPTI="-Ofast -pthread -fopenmp -flto -fstrict-aliasing -ftree-vectorize -funroll-loops -ffinite-loops -finline-functions -fno-stack-protector -fomit-frame-pointer -fpic -falign-functions=64 -D_REENTRANT -mllvm -enable-loop-distribute"

./configure CXXFLAGS="$ARCH $extracflags $March $CORE $OPTI" CFLAGS="$ARCH $extracflags $March $CORE $OPTI" \
CXX=clang++ CC=clang  LDFLAGS="-Wl,-hugetlbfs-align -fuse-ld=lld"


# To change the cuda arch, edit Makefile.am and run ./build.sh


