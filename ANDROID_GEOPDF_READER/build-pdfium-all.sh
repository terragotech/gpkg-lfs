#!/bin/bash
export TP=$PWD
for f in "arm" "armv7" "arm64" "mips" "mips64" "x86" "x86_64"; do
#for f in "armv7"; do
if [ "$f" = "arm" ]
then
./build-pdfium-android.sh $TP/android-21-arm/bin arm-linux-androideabi $TP/armeabi	
fi
if [ "$f" = "armv7" ]
then
./build-pdfium-android.sh $TP/android-21-arm/bin arm-linux-androideabi $TP/armeabi-v7a	
fi
if [ "$f" = "arm64" ]
then
./build-pdfium-android.sh $TP/android-21-arm64/bin aarch64-linux-android $TP/arm64-v8a	
fi
#End of the Arm Builds
if [ "$f" = "mips" ]
then
./build-pdfium-android.sh $TP/android-21-mips/bin mipsel-linux-android $TP/mips	
fi
if [ "$f" = "mips64" ]
then
./build-pdfium-android.sh $TP/android-21-mips64/bin mips64el-linux-android $TP/mips64	
fi
#MIPS Build done
if [ "$f" = "x86" ]
then
./build-pdfium-android.sh $TP/android-21-x86/bin i686-linux-android $TP/x86	
fi
if [ "$f" = "x86_64" ]
then
./build-pdfium-android.sh $TP/android-21-x86_64/bin x86_64-linux-android $TP/x86_64	
fi
#Intel Build Done
done
