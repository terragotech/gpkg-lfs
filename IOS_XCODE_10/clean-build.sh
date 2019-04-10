#!/bin/sh
#Build for iPhone
export platform=iphoneos
export arch="arm64"
export platform_dir=`xcrun -find -sdk ${platform} --show-sdk-platform-path`
export platform_sdk_dir=`xcrun -find -sdk ${platform} --show-sdk-path`
echo 
export CC=`xcrun -find -sdk iphoneos clang`
export CFLAGS="-DGDAL_COMPILATION -Wno-error=implicit-function-declaration -arch ${arch} -pipe -Os -gdwarf-2 -isysroot ${platform_sdk_dir} ${extra_cflags} -stdlib=libc++ -miphoneos-version-min=9.3"
export LDFLAGS="-arch ${arch} -isysroot ${platform_sdk_dir}"
export CXX=`xcrun -find -sdk iphoneos clang++`
export CXXFLAGS="${CFLAGS}"
export CXXCPP="${CXX}" 
export PORT_INCLUDE=$PWD/port
export CORE_INCLUDE=$PWD/gcore
export ALG_INCLUDE=$PWD/gcore
export OGR_INCLUDE=$PWD/ogr
export OGRFRMTS_INCLUDE=$PWD/ogr/ogrsf_frmts
export PROJ_INCLUDE=/Users/admin/Desktop/GoodStart/proj-4.8.0/src
export SQLITE_INCLUDE=/Users/admin/Desktop/GoodStart/sqlite-autoconf-3190300
export PDFIUM_INCLUDE=/Users/admin/Desktop/GoodStart/pdfiumBuild/device/pdfium/install/include
cd port
make -f makefile clean
cd ..
cd gcore
make -f makefile clean
cd ..
cd gcore/mdreader
make -f makefile clean
cd ..
cd ..
cd alg
make -f makefile clean
cd ..
cd frmts/gtiff/libtiff
make -f makefile clean
cd ..
cd ..
cd ..
cd frmts
make -f makefile clean
cd ..
cd frmts/gtiff
make -f makefile clean
cd ..
cd ..
cd frmts/gtiff/libgeotiff
make -f makefile clean
cd ..
cd ..
cd ..
cd frmts/hfa
make -f makefile clean
cd ..
cd ..
cd frmts/jpeg 
make -f makefile clean
cd ..
cd ..
cd frmts/png 
make -f makefile clean
cd ..
cd ..
cd frmts/zlib
make -f makefile clean
cd ..
cd ..
cd frmts/raw 
make -f makefile clean
cd ..
cd ..
cd frmts/mem
echo Making MEM Driver
make -f makefile clean
cd ..
cd ..
echo Making VRT Driver
cd frmts/vrt
make -f makefile clean
cd ..
cd ..
echo Making PDF Driver
cd frmts/pdf 
make -f makefile clean
cd ..
cd ..
echo Making OGR formats
cd ogr/ogrsf_frmts/generic
make -f makefile clean
cd ..
cd ..
cd ..
cd ogr/ogrsf_frmts/geojson/libjson
make -f makefile clean
cd ..
make -f makefile clean
cd ..
cd ..
cd ..
cd ogr/ogrsf_frmts/mem
make -f makefile clean
cd ..
cd ..
cd ..
cd ogr/ogrsf_frmts/kml
make -f makefile clean
cd ..
cd ..
cd ..
pwd
cd ogr/ogrsf_frmts/mitab
make -f makefile clean
cd ..
cd ..
cd ..
cd ogr/ogrsf_frmts/xplane
make -f makefile clean
cd ..
cd ..
cd ..
cd ogr
make -f makefile clean
cd ..
echo APPS
cd apps
make -f makefile clean
cd ..
pwd
echo GPKG
cd ogr/ogrsf_frmts/gpkg
make -f makefile clean
cd ..
cd ..
cd ..
cd ogr/ogrsf_frmts/sqlite
make -f makefile clean
cd ..
cd ..
cd ..