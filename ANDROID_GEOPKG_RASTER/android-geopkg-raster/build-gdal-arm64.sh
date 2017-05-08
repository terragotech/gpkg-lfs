#!/bin/bash
#This script builds gdal for arm64 android
if [ $# -lt 2 ]
then
   echo Bad parameters
   echo 'param1' tool chain path e.g /home/ganesan/works/android-geopkg-raster/android-21-arm64
   echo 'param2' source code path e.g /home/ganesan/works/android-geopkg-raster
   echo example:
   echo =======
   echo ./build-gdal-arm64.sh /home/ganesan/works/android-geopkg-raster/android-21-arm64 /home/ganesan/works/android-geopkg-raster
else
export GDAL_TP_FOLDER=$2
export LIBS="-lsupc++ -lstdc++"
export BUILD_PATH=$1
export PATH=$PATH:$BUILD_PATH/bin
cd gdal-2.1.0
./configure --host=aarch64-linux-android --without-grib --with-static-proj4=$GDAL_TP_FOLDER/arm64-v8a --with-sqlite3=$GDAL_TP_FOLDER/arm64-v8a
make clean
make
cp .libs/libgdal.a $GDAL_TP_FOLDER/arm64-v8a/lib/libgdal.a
fi

