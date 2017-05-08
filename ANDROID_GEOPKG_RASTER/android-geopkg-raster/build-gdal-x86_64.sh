#!/bin/bash
echo /home/ganesan/works/android-geopkg-raster
if [ $# -lt 2 ]
then
   echo Bad parameters
   echo 'param1' tool chain path e.g /home/ganesan/works/android-geopkg-raster/android-21-x86_64
   echo 'param2' source code path e.g /home/ganesan/works/android-geopkg-raster
else
export GDAL_TP_FOLDER=$2
export LIBS="-lsupc++ -lstdc++"
export BUILD_PATH=$1
export PATH=$PATH:$BUILD_PATH/bin
cd gdal-2.1.0
./configure --host=x86_64-linux-android --without-grib --with-static-proj4=$GDAL_TP_FOLDER/x86_64 --with-sqlite3=$GDAL_TP_FOLDER/x86_64
make clean
make
cp .libs/libgdal.a $GDAL_TP_FOLDER/x86_64/lib/libgdal.a
fi
