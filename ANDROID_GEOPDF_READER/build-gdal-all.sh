#!/bin/bash
export TP=$PWD
for f in "arm" "armv7" "arm64" "mips" "mips64" "x86" "x86_64"; do
if [ "$f" = "arm" ]
then
./build-gdal-armeabi.sh $TP/android-21-arm/bin $TP
fi
if [ "$f" = "armv7" ]
then
./build-gdal-armeabi-v7a.sh $TP/android-21-arm/bin $TP
fi
if [ "$f" = "arm64" ]
then
./build-gdal-arm64.sh $TP/android-21-arm64/bin $TP
fi
#End of the Arm Builds
if [ "$f" = "mips" ]
then
./build-gdal-mips.sh   $TP/android-21-mips/bin $TP
fi
if [ "$f" = "mips64" ]
then
./build-gdal-mips64.sh $TP/android-21-mips64/bin $TP
fi
#MIPS Build done
if [ "$f" = "x86" ]
then
./build-gdal-x86.sh    $TP/android-21-x86/bin $TP	
fi
if [ "$f" = "x86_64" ]
then
./build-gdal-x86_64.sh $TP/android-21-x86_64/bin $TP	
fi
#Intel Build Done
done
