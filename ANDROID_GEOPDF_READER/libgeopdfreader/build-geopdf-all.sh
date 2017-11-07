#!/bin/bash
 
export TP=$1
export NF=$2
for f in "armeabi" "armeabi-v7a" "arm64-v8a" "x86" "x86_64" "mips" "mips64"; do
#for f in "armeabi-v7a"; do
rm -rf obj/
rm -rf libs/	
echo Building $f
./generate-script.sh $TP $f
$2/ndk-build
echo libs/$f/libgeopdfreader.so $TP/$f/lib/libgeopdfreader.so
cp libs/$f/libgeopdfreader.so $TP/$f/lib/libgeopdfreader.so
done

