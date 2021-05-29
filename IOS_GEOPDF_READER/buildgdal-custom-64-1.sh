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
export OFILES=$PWD/gdal-2.1.0/frmts/o/
export OGRFILES=$PWD/gdal-2.1.0/ogr/ogrsf_frmts/o/
cd gdal-2.1.0
cd frmts
cd zlib
make -f buildzlib.mk clean
make -f buildzlib.mk
cp *.o $OFILES
cd ..
cd vrt
make -f buildvrt.mk clean
make -f buildvrt.mk 
cp *.o $OFILES
cd ..
cd mem
make -f buildmem.mk clean
make -f buildmem.mk 
cp *.o $OFILES
cd ..
cd raw
make -f buildraw.mk clean
make -f buildraw.mk
cp *.o $OFILES
cd ..
cd pdf
make -f buildpdf.mk clean
make -f buildpdf.mk
cp *.o $OFILES
cd ..
cd png
make -f buildpng.mk clean
make -f buildpng.mk
cp *.o $OFILES
cd ..
cd jpeg
make -f buildjpeg.mk clean
make -f buildjpeg.mk
cp *.o $OFILES
cd ..
cd hfa
make -f buildhfa.mk clean
make -f buildhfa.mk
cp *.o $OFILES
cd ..
cd gtiff
make -f buildgtiffg.mk clean
make -f buildgtiffg.mk
cp *.o $OFILES
cd libgeotiff
make -f buildgeotiff.mk clean
make -f buildgeotiff.mk
cp *.o $OFILES
cd ..
cd libtiff
make -f buildtiff.mk clean
make -f buildtiff.mk
cp *.o $OFILES
cd ..
cd ..
echo $PWD
#formats

