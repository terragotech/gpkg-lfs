#!/bin/bash

export BUILD_LIB_PATH=$1
export NDK_PATH=$2
mkdir mlibs
for f in "arm64-v8a" "armeabi" "armeabi-v7a" "mips" "mips64" "x86" "x86_64"; do
rm -rf ./obj
rm -rf ./libs
mkdir mlibs/$f
./build-geopkg-raster.sh $BUILD_LIB_PATH $f $NDK_PATH
cp ./libs/$f/libgeopkgraster.so ./mlibs/$f/libgeopkgraster.so
done


