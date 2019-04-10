#!/bin/sh
#Build for iPhone
export platform=$2
export arch="$1"
export platform_dir=`xcrun -find -sdk ${platform} --show-sdk-platform-path`
export platform_sdk_dir=`xcrun -find -sdk ${platform} --show-sdk-path`
export CC=`xcrun -find -sdk $2 clang`
export GDAL_RT="$PWD"
export TIF_FLAGS="-DHAVE_LIBJPEG -DINTERNAL_LIBTIFF -I${GDAL_RT}/frmts/gtiff/libtiff -DBIGTIFF_SUPPORT"
export GEOTIF_FLAGS="-DHAVE_LIBJPEG -DINTERNAL_LIBGEOTIFF -I${GDAL_RT}/frmts/gtiff/libgeotiff -DBIGTIFF_SUPPORT"
export CFLAGS="-DGDAL_COMPILATION -Wno-error=implicit-function-declaration -arch ${arch} -pipe -Os -gdwarf-2 -isysroot ${platform_sdk_dir} ${extra_cflags} -stdlib=libc++ -m$2-version-min=9.3"
echo NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN
echo $CFLAGS
echo NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN
export LDFLAGS="-arch ${arch} -isysroot ${platform_sdk_dir}"
export CXX=`xcrun -find -sdk iphoneos clang++`
export CXXFLAGS="${CFLAGS}"
export CXXCPP="${CXX}" 
export APPS_INCLUDE="-I$GDAL_RT/apps"
export PORT_INCLUDE="-I$GDAL_RT/port"
export VRT_INCLUDE="-I$GDAL_RT/frmts/vrt"
export FRMTS_INC="-I$GDAL_RT/frmts"
export CORE_INCLUDE="-I$GDAL_RT/gcore"
export ALG_INCLUDE="-I$GDAL_RT/alg"
export OGR_INCLUDE="-I$GDAL_RT/ogr"
export JPEG_LIBJPEG="-I$GDAL_RT/frmts/jpeg/libjpeg"
export JPEG_INC="-I$GDAL_RT/frmts/jpeg"
export MEM_INCLUDE="-I$GDAL_RT/frmts/mem"
export RAW_INCLUDE="-I$GDAL_RT/frmts/raw"
export GTIF_INCLUDE="-I$GDAL_RT/frmts/gtiff"
export LIBPNG_INCLUDE="-I$GDAL_RT/frmts/png/libpng"
export PNGFRM_INCLUDE="-I$GDAL_RT/frmts/png"
export OGRFRMTS_INCLUDE="-I$GDAL_RT/ogr/ogrsf_frmts"
export OGRFRMTS_SQLITE_INCLUDE="-I$GDAL_RT/ogr/ogrsf_frmts/sqlite"
export JPEG_CFLAGS="-DENABLE_LIBJPEG_NO_RETURN"
export PROJ_INCLUDE="-I$3/proj-4.8.0/src"
export PROJ_FLAGS="-DPROJ_STATIC"
export SQLITE_INCLUDE="-I$3/sqlite-autoconf-3190300"
export PDFIUM_INCLUDE="-I$3/pdfiumBuild/device/pdfium/install/include -I$3/pdfiumBuild/device/pdfium/install/include/pdfium"
export PDF_CFLAGS="-std=c++11 -DHAVE_PDFIUM"
export PNG_CFLAGS="-DPNG_NO_GLOBAL_ARRAYS"
export ZLIB_CFLAGS="-DDONT_DEPRECATE_SPRINTF"
export MITAB_FLAGS="-DOGR -DMITAB_USE_OFTDATETIME"
export PROJ_STATIC=yes
echo $CFLAGS
echo $TIF_FLAGS
cd port
make -f makefile
cp *.o ../o/
cd ..
cd gcore
make -f makefile
cp *.o ../o/
cd ..
cd gcore/mdreader
make -f makefile
cp *.o ../../o/
cd ..
cd ..
cd alg
make -f makefile
cp *.o ../o/
cd ..
cd frmts/gtiff/libtiff
make -f makefile
cp *.o ../../../o/
cd ..
cd ..
cd ..
cd frmts
make -f makefile
cp *.o ../o/
cd ..
cd frmts/gtiff
make -f makefile
cp *.o ../../o/
cd ..
cd ..
cd frmts/gtiff/libgeotiff
make -f makefile
cp *.o ../../../o/
cd ..
cd ..
cd ..
echo TIF processing .... Good
cd frmts/hfa
make -f makefile
cp *.o ../../o/
cd ..
cd ..
cd frmts/jpeg
make -f makefile
cp *.o ../../o/
cd ..
cd ..
cd frmts/png
make -f makefile
cp *.o ../../o/
cd ..
cd ..
cd frmts/zlib
make -f makefile
cp *.o ../../o/
cd ..
cd ..
cd frmts/raw
make -f makefile
cp *.o ../../o/
cd ..
cd ..
cd frmts/mem
echo Making MEM Driver
make -f makefile
cp *.o ../../o/
cd ..
cd ..
echo Making VRT Driver
cd frmts/vrt
make -f makefile
cp *.o ../../o/
cd ..
cd ..
echo Making PDF Driver
cd frmts/pdf
make -f makefile
cp *.o ../../o/
cd ..
cd ..
echo Making OGR formats
cd ogr/ogrsf_frmts/generic
make -f makefile
cp *.o ../../../o/
cd ..
cd ..
cd ..
cd ogr/ogrsf_frmts/geojson/libjson
make -f makefile
cp *.o ../../../../o/
cd ..
make -f makefile
cp *.o ../../../o/
cd ..
cd ..
cd ..
cd ogr/ogrsf_frmts/mem
make -f makefile
cp *.o ../../../o/
cd ..
cd ..
cd ..
cd ogr/ogrsf_frmts/kml
make -f makefile
cp *.o ../../../o/
cd ..
cd ..
cd ..
pwd
cd ogr/ogrsf_frmts/mitab
make -f makefile
cp *.o ../../../o/
cd ..
cd ..
cd ..
cd ogr/ogrsf_frmts/xplane
make -f makefile
cp *.o ../../../o/
cd ..
cd ..
cd ..
cd ogr
make -f makefile
cp *.o ../o/
cd ..
cd apps
make -f makefile
cp *.o ../o/
cd ..
cd ogr/ogrsf_frmts/gpkg
make -f makefile
cp *.o ../../../o/
cd ..
cd ..
cd ..
cd ogr/ogrsf_frmts/sqlite
make -f makefile
cp *.o ../../../o/
cd ..
cd ..
cd ..
