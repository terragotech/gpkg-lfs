#!/bin/sh
#Build for iPhone
export platform=iphoneos 
export platform=iphoneos
export arch="armv7s"
export platform_dir=`xcrun -find -sdk ${platform} --show-sdk-platform-path`
platform_sdk_dir=`xcrun -find -sdk ${platform} --show-sdk-path`


#setup compiler flags

export CC=`xcrun -find -sdk iphoneos gcc`
export CFLAGS="-Wno-error=implicit-function-declaration -arch ${arch} -pipe -Os -gdwarf-2 -isysroot ${platform_sdk_dir} ${extra_cflags}"
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
export host="${arch}-apple-darwin"
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
if [ $build_gda = "1" ]
	then
cd proj-4.8.0
echo ////////////////////////////////////////////////////////////
echo $PREFIX_PROJ/armv7s
./configure --prefix=$PREFIX_PROJ/armv7s \
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
echo $PREFIX_SQLITE/armv7s
./configure --prefix=$PREFIX_SQLITE/armv7s --host=$host
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
    --prefix=$PREFIX_GDAL/armv7s \
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
    --with-static-proj4=$PREFIX_PROJ/armv7s \
    --with-sqlite3=$PREFIX_SQLITE/armv7s \
    --with-pdfium=$PREFIX_PDFIUM
./configure \
    --prefix=$PREFIX_GDAL/armv7s \
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
    --with-static-proj4=$PREFIX_PROJ/armv7s \
    --with-sqlite3=$PREFIX_SQLITE/armv7s \
    --with-pdfium=$PREFIX_PDFIUM
make clean
make
mkdir -p $PREFIX_GDAL/armv7s
rm -f $PREFIX_GDAL/armv7s/libgdal.a
cp .libs/libgdal.a $PREFIX_GDAL/armv7s/libgdal.a
echo file copied
fi
