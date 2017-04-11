#!/bin/bash
PREFIX=`pwd`/install/
rm -rf $PREFIX
mkdir $PREFIX
LOG=./log
rm -rf $LOG
mkdir $LOG

if [ -e ${PREFIX} ]
then
	echo removing ${PREFIX}
	rm -rf ${PREFIX}
fi

mkdir ${PREFIX}

for f in "armv7" "armv7s" "arm64"; do
echo Building $f
./build_gdal_ios.sh -p ${PREFIX} -a $f device 2>&1 | tee "${LOG}/${f}.txt"
done

echo Building simulator
for f in "i386" "x86_64"; do
echo Building $f
./build_gdal_ios.sh -p ${PREFIX} -a $f simulator 2>&1 | tee "${LOG}/simulator.txt"
done


SDK_VERSION=8.3

lipo \
${PREFIX}/i386/iphonesimulator${SDK_VERSION}.sdk/lib/libgdal.a \
${PREFIX}/x86_64/iphonesimulator${SDK_VERSION}.sdk/lib/libgdal.a \
${PREFIX}/armv7/iphoneos${SDK_VERSION}.sdk/lib/libgdal.a \
${PREFIX}/armv7s/iphoneos${SDK_VERSION}.sdk/lib/libgdal.a \
${PREFIX}/arm64/iphoneos${SDK_VERSION}.sdk/lib/libgdal.a \
-output ${PREFIX}/libgdal.a \
-create | tee $LOG/lipo.txt

lipo \
${PREFIX}/i386/iphonesimulator${SDK_VERSION}.sdk/lib/libproj.a \
${PREFIX}/x86_64/iphonesimulator${SDK_VERSION}.sdk/lib/libproj.a \
${PREFIX}/armv7/iphoneos${SDK_VERSION}.sdk/lib/libproj.a \
${PREFIX}/armv7s/iphoneos${SDK_VERSION}.sdk/lib/libproj.a \
${PREFIX}/arm64/iphoneos${SDK_VERSION}.sdk/lib/libproj.a \
-output ${PREFIX}/libproj.a \
-create | tee $LOG/lipo-proj.txt

#Generate files without simulator
lipo \
${PREFIX}/armv7/iphoneos${SDK_VERSION}.sdk/lib/libgdal.a \
${PREFIX}/armv7s/iphoneos${SDK_VERSION}.sdk/lib/libgdal.a \
${PREFIX}/arm64/iphoneos${SDK_VERSION}.sdk/lib/libgdal.a \
-output ${PREFIX}/libgdal_min.a \
-create

lipo \
${PREFIX}/armv7/iphoneos${SDK_VERSION}.sdk/lib/libproj.a \
${PREFIX}/armv7s/iphoneos${SDK_VERSION}.sdk/lib/libproj.a \
${PREFIX}/arm64/iphoneos${SDK_VERSION}.sdk/lib/libproj.a \
-output ${PREFIX}/libproj_min.a \
-create

#create zipfile for cocoapods distribution
cd ${PREFIX}
mkdir GDAL
#copy files without simulator
cp libproj_min.a ${PREFIX}/libproj_min.a
cp libgdal_min.a ${PREFIX}/libgdal_min.a

cp libgdal.a ${PREFIX}/libproj.a GDAL
cp arm64/iphoneos8.3.sdk/include/*.h GDAL
zip gdal.zip GDAL/*