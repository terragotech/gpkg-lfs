#!/bin/bash
export platform=iphoneos
export arch="arm64"
export platform_dir=`xcrun -find -sdk ${platform} --show-sdk-platform-path`
platform_sdk_dir=`xcrun -find -sdk ${platform} --show-sdk-path`
export CC=`xcrun -find -sdk iphoneos clang`
export CFLAGS="-I${platform_sdk_dir}/usr/include -stdlib=libc++ -Wno-error=implicit-function-declaration -arch ${arch} -pipe -Os -gdwarf-2 -isysroot ${platform_sdk_dir} ${extra_cflags} "
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
make -f gdaltest.mk