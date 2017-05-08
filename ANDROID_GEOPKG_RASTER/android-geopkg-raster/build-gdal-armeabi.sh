#!/bin/bash
echo /home/ganesan/works/android-geopkg-raster
if [ $# -lt 2 ]
then
   echo Bad parameters
   echo 'param1' tool chain path e.g /home/ganesan/works/android-geopkg-raster/android-21-arm
   echo 'param2' source code path e.g /home/ganesan/works/android-geopkg-raster
else
export GDAL_TP_FOLDER=$2
export CFLAGS="-mthumb -march=armv7" 
export CXXFLAGS="-mthumb" LIBS="-lsupc++ -lstdc++"
export LIBS="-lsupc++ -lstdc++"
export BUILD_PATH=$1
export PATH=$PATH:$BUILD_PATH/bin
cd gdal-2.1.0
./configure --host=arm-linux-androideabi --without-grib --with-static-proj4=$GDAL_TP_FOLDER/armeabi --with-sqlite3=$GDAL_TP_FOLDER/armeabi
make clean
make
cp .libs/libgdal.a $GDAL_TP_FOLDER/armeabi/lib/libgdal.a
fi

