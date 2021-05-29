#!/bin/bash
export platform=iphoneos
export arch="arm64"
export platform_dir=`xcrun -find -sdk ${platform} --show-sdk-platform-path`
platform_sdk_dir=`xcrun -find -sdk ${platform} --show-sdk-path`
export CC=`xcrun -find -sdk iphoneos clang`
export CFLAGS=" -stdlib=libc++ -Wno-error=implicit-function-declaration -arch ${arch} -pipe -Os -gdwarf-2 -isysroot ${platform_sdk_dir} ${extra_cflags} -c"
export LDFLAGS="-arch ${arch} -isysroot ${platform_sdk_dir}"
export CPP=`xcrun -find -sdk iphoneos clang++ `
export CXXFLAGS="${CFLAGS} -std=c++11"
export CXX=`xcrun -find -sdk iphoneos cpp`
export CXX1CPP="${CPP}"
echo ${platform_dir}
echo ${platform_sdk_dir}
echo CC ${CC}
echo C++ ${CXX}
echo LDFLAGS ${LDFLAGS}
export host="arm-apple-darwin"
cd bigint
make -f ios-bigint.mk clean
make -f ios-bigint.mk
cd ..
cd zlib_v128
make -f libzlib.mk clean
make -f libzlib.mk
cd ..
cd libopenjpeg20
make -f libopenjpeg.mk clean
make -f libopenjpeg.mk
cd ..
cd libjpeg
make -f libjpeg.mk clean
make -f libjpeg.mk
cd ..
cd freetype
make -f libfreetype.mk clean
make -f libfreetype.mk 
cd ..
cd lcms2-2.6
make -f lcms.mk clean
make -f lcms.mk
cd ..
cd agg23
make -f agg.mk clean
make -f agg.mk 
cd ..
 
