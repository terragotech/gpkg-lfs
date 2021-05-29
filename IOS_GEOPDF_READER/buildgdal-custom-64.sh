#!/bin/bash
export platform=iphoneos
export arch="arm64"
export platform_dir=`xcrun -find -sdk ${platform} --show-sdk-platform-path`
platform_sdk_dir=`xcrun -find -sdk ${platform} --show-sdk-path`
export CC=`xcrun -find -sdk iphoneos clang`

export CFLAGS="-DGDAL_COMPILATION=1 -DPROJ_STATIC=1 -I/Users/viswanathansubramanian/gpkg-lfs/IOS_GEOPDF_READER/proj4/arm64/include -I${platform_sdk_dir}/usr/include -stdlib=libc++ -Wno-error=implicit-function-declaration -arch ${arch} -pipe -Os -gdwarf-2 -isysroot ${platform_sdk_dir} ${extra_cflags} -c"
export LDFLAGS="-arch ${arch} -isysroot ${platform_sdk_dir}"
export CPP=`xcrun -find -sdk iphoneos clang++ `
export CXXFLAGS="${CFLAGS} -std=c++11 "
export CXX=`xcrun -find -sdk iphoneos cpp`
export CXX1CPP="${CPP}"
echo ${platform_dir}	
echo ${platform_sdk_dir}
echo CC ${CC}
echo C++ ${CXX}
echo LDFLAGS ${LDFLAGS}
export host="arm-apple-darwin"
rm -f ./gdal-2.1.0/frmts/o/*.o
rm -f ./gdal-2.1.0/ogr/ogrsf_frmts/o/*.o
export OFILES=$PWD/gdal-2.1.0/frmts/o/
export OGRFILES=$PWD/gdal-2.1.0/ogr/ogrsf_frmts/o/
cd gdal-2.1.0
cd apps
make -f buildogrlib.mk clean
make -f buildogrlib.mk
make -f buildgwarp.mk clean
make -f buildgwarp.mk
cp *.o $OFILES
cd ..
cd gcore
make -f buildgcore.mk clean
make -f buildgcore.mk
cp *.o $OFILES
cd mdreader
make -f buildmdreader.mk clean
make -f buildmdreader.mk
cp *.o $OFILES
cd ..
cd ..
cd port
make -f buildport.mk clean
make -f buildport.mk
cp *.o $OFILES
cd ..
cd ogr
cd ogrsf_frmts
cd generic
make -f buildgeneric.mk clean
make -f buildgeneric.mk
cp *.o $OGRFILES
cd ..
cd geojson
make -f buildgeojson.mk clean
make -f buildgeojson.mk 
cp *.o $OGRFILES
cd libjson
make -f buildjson.mk clean
make -f buildjson.mk
cp *.o $OGRFILES
cd ..
cd ..
cd sqlite
make -f buildogrsqlite.mk clean
make -f buildogrsqlite.mk
cp *.o $OGRFILES
cd ..
cd mem
make -f buildmem.mk clean
make -f buildmem.mk
cp *.o $OGRFILES
cd ..
cd kml
make -f buildkml.mk clean
make -f buildkml.mk
cp *.o $OGRFILES
cd ..
cd mitab
make -f buildmitab.mk clean
make -f buildmitab.mk
cp *.o $OGRFILES
cd ..
cd xplane
make -f buildxplane.mk clean
make -f buildxplane.mk
cp *.o $OGRFILES
cd ..
cd gpkg
make -f buildgpkg.mk clean
make -f buildgpkg.mk
cp *.o $OGRFILES
cd ..
cd ..
cd ..
echo $PWD
cd alg
make -f buildalg.mk clean
make -f buildalg.mk
cp *.o $OFILES 
cd ..
cd frmts
make -f buildfrmts.mk clean
make -f buildfrmts.mk
cp *.o $OFILES
cd ..
cd ..
echo $PWD
cd gdal-2.1.0
cd ogr
make -f buildogr.mk clean
make -f buildogr.mk
cp *.o $OFILES
cd ..
cd ..

