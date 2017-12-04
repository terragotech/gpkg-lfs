#!/bin/bash
if [ $# -lt 2 ]
then
	echo Insufficient arguments
	echo Param1 - Compiler location
	echo Param2 - 3rdParty Folder
else
export LIBS="-lsupc++ -lstdc++"
export BUILD_PATH=$1
export PATH=$PATH:$BUILD_PATH
export TP_FOLDER=$2
cd gdal-2.1.0
./configure --host=mipsel-linux-android --without-grib --with-pdfium=$TP_FOLDER/mips/pdfium/install --with-static-proj4=$TP_FOLDER/mips --with-sqlite3=$TP_FOLDER/mips
make clean
sed -i '/soname_spec=/c\soname_spec="libgdal210.so"' libtool
cat libtool | grep "soname_spec="
make
cp .libs/libgdal.a $TP_FOLDER/mips/lib/libgdal.a
cp .libs/libgdal.so.20.1.0 $TP_FOLDER/mips/lib/libgdal210.so
fi


