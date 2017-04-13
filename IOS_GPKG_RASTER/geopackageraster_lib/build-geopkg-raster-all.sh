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
./build-geopkg-raster.sh -p ${PREFIX} -a $f device 2>&1 | tee "${LOG}/${f}.txt"
done

echo Building simulator
for f in "i386" "x86_64"; do
echo Building $f
./build-geopkg-raster.sh -p ${PREFIX} -a $f simulator 2>&1 | tee "${LOG}/simulator.txt"
done
rm libGeoPackageRasterReader.a
lipo install/i386/libGeoPackageRasterReader.a install/x86_64/libGeoPackageRasterReader.a install/armv7/libGeoPackageRasterReader.a install/armv7s/libGeoPackageRasterReader.a install/arm64/libGeoPackageRasterReader.a -output libGeoPackageRasterReader.a -create 
