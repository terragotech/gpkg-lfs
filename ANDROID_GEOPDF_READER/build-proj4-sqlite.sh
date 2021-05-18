#!/bin/bash
#This script generates static lib for sqlite and proj4
export PATH=$PATH:$PWD/android-ndk-r21e
export NDK_PROJECT_PATH=$PWD
echo Starting the NDK build ...
rm -rf ./obj
ndk-build
#for f in "./arm64-v8a" "./armeabi" "./armeabi-v7a" "./mips" "./mips64" "./x86" "./x86_64"; do
for f in "./arm64-v8a"; do
if [ -d "$f" ]
then
echo Using existing folders ...
else
mkdir $f
mkdir "$f/include"
mkdir "$f/lib"
fi
done

echo Copying files ...
cp ./jni/proj-4.8.0/src/*.h ./arm64-v8a/include/
#cp ./jni/proj-4.8.0/src/*.h ./armeabi/include/
#cp ./jni/proj-4.8.0/src/*.h ./armeabi-v7a/include/
#cp ./jni/proj-4.8.0/src/*.h ./mips/include/
#cp ./jni/proj-4.8.0/src/*.h ./mips64/include/
#cp ./jni/proj-4.8.0/src/*.h ./x86/include/
#cp ./jni/proj-4.8.0/src/*.h ./x86_64/include/

cp ./jni/sqlite-amalgamation-3100200/*.h ./arm64-v8a/include/
#cp ./jni/sqlite-amalgamation-3100200/*.h ./armeabi/include/
#cp ./jni/sqlite-amalgamation-3100200/*.h ./armeabi-v7a/include/
#cp ./jni/sqlite-amalgamation-3100200/*.h ./mips/include/
#cp ./jni/sqlite-amalgamation-3100200/*.h ./mips64/include/
#cp ./jni/sqlite-amalgamation-3100200/*.h ./x86/include/
#cp ./jni/sqlite-amalgamation-3100200/*.h ./x86_64/include/

cp $PWD/obj/local/arm64-v8a/*.a ./arm64-v8a/lib/
#cp $PWD/obj/local/armeabi/*.a ./armeabi/lib/
#cp $PWD/obj/local/armeabi-v7a/*.a ./armeabi-v7a/lib/
#cp $PWD/obj/local/mips/*.a ./mips/lib/
#cp $PWD/obj/local/mips64/*.a ./mips64/lib/
#cp $PWD/obj/local/x86/*.a ./x86/lib/
#cp $PWD/obj/local/x86_64/*.a ./x86_64/lib/

rm -rf ./obj
