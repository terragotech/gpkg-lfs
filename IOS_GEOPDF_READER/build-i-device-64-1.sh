#!/bin/sh
#Build for iPhone
export platform=iphoneos 
export platform=iphoneos
export arch="arm64"
export platform_dir=`xcrun -find -sdk ${platform} --show-sdk-platform-path`
platform_sdk_dir=`xcrun -find -sdk ${platform} --show-sdk-path`

export OFILES=$PWD/gdal-2.1.0/frmts/o/
export OGRFILES=$PWD/gdal-2.1.0/ogr/ogrsf_frmts/o/

#setup compiler flags

export CC=`xcrun -find -sdk iphoneos gcc`
export CFLAGS="-stdlib=libc++ -DSQLITE_ENABLE_COLUMN_METADATA=1 -Wno-error=implicit-function-declaration -arch ${arch} -pipe -Os -gdwarf-2 -isysroot ${platform_sdk_dir} ${extra_cflags} -I${platform_sdk_dir}/usr/include"
export LDFLAGS="-arch ${arch} -isysroot ${platform_sdk_dir}"
export CXX=`xcrun -find -sdk iphoneos g++`
export CXXFLAGS="${CFLAGS}"
export CPP=`xcrun -find -sdk iphoneos cpp`
export CXXCPP="${CPP}"

echo ${platform_dir}
echo ${platform_sdk_dir}

echo CC ${CC}
echo C++ ${CXX}
echo LDFLAGS ${LDFLAGS}
export host="arm-apple-darwin"
echo Host:${host}
echo CPP Options:${CXXFLAGS}
#############PDFIUM Cross Compiler######################
export AS=`xcrun -find -sdk iphoneos as`
export AR=`xcrun -find -sdk iphoneos ar`
export LD=`xcrun -find -sdk iphoneos ld`
export NM=`xcrun -find -sdk iphoneos nm`
export RANLIB=`xcrun -find -sdk iphoneos ranlib`
#############END OF PDFIUM Cross Compiler ##############
mkdir $PWD/proj4
mkdir $PWD/gdal210
mkdir $PWD/sqlite3Build
export PREFIX_GDAL=$PWD/gdal210
export PREFIX_PDFIUM=$PWD/pdfiumBuild/device/pdfium/install
export PREFIX_PROJ=$PWD/proj4
export PREFIX_SQLITE=$PWD/sqlite3Build

export build_gda="0"
if [ $build_gda = "0" ]
	then
cd proj-4.8.0
echo ////////////////////////////////////////////////////////////
echo $PREFIX_PROJ/arm64
./configure --prefix=$PREFIX_PROJ/arm64 \
    --enable-shared=no \
   --enable-static=yes \
    --host=$host
echo ////////////////////////////////////////////////////////////
make clean
make
make install
cd ..


cd sqlite-autoconf-3190300
echo ////////////////////////////////////////////////////////////
echo $PREFIX_SQLITE/arm64
./configure --prefix=$PREFIX_SQLITE/arm64 --host=$host
echo ////////////////////////////////////////////////////////////

make clean
make
make install
cd ..
fi
export build_gdal="1"
if [ $build_gdal = "1" ]
	then
cd gdal-2.1.0
echo "configure gdal"
echo ./configure \
    --prefix=$PREFIX_GDAL/arm64 \
    --host=$host \
    --disable-shared \
    --enable-static \
    --with-hide-internal-symbols \
    --with-unix-stdio-64=no \
    --with-geos=no \
    --without-pg \
    --without-grass \
    --without-libgrass \
    --without-cfitsio \
    --without-pcraster \
    --without-netcdf \
    --without-ogdi \
    --without-fme \
    --without-hdf4 \
    --without-hdf5 \
    --without-jasper \
    --without-kakadu \
    --without-grib \
    --without-mysql \
    --without-ingres \
    --without-xerces \
    --without-odbc \
    --without-curl \
    --without-idb \
    --without-sde \
    --with-sse=no \
    --with-avx=no \
    --with-static-proj4=$PREFIX_PROJ/arm64 \
    --with-sqlite3=$PREFIX_SQLITE/arm64 \
    --with-pdfium=$PREFIX_PDFIUM
./configure \
    --prefix=$PREFIX_GDAL/arm64 \
    --host=$host \
    --disable-shared \
    --enable-static \
    --with-hide-internal-symbols \
    --with-unix-stdio-64=no \
    --with-geos=no \
    --without-pg \
    --without-grass \
    --without-libgrass \
    --without-cfitsio \
    --without-pcraster \
    --without-netcdf \
    --without-ogdi \
    --without-fme \
    --without-hdf4 \
    --without-hdf5 \
    --without-jasper \
    --without-kakadu \
    --without-grib \
    --without-mysql \
    --without-ingres \
    --without-xerces \
    --without-odbc \
    --without-curl \
    --without-idb \
    --without-sde \
    --with-sse=no \
    --with-avx=no \
    --with-static-proj4=$PREFIX_PROJ/arm64 \
    --with-sqlite3=$PREFIX_SQLITE/arm64 \
    --with-pdfium=$PREFIX_PDFIUM
make clean
make
mkdir -p $PREFIX_GDAL/arm64
rm -f $PREFIX_GDAL/arm64/libgdal.a
cp .libs/libgdal.a $PREFIX_GDAL/arm64/libgdal.a
echo file copied
fi