#!/bin/sh
#Build for iPhone
export platform=iphoneos
export arch="armv7s"
export platform_dir=`xcrun -find -sdk ${platform} --show-sdk-platform-path`
export platform_sdk_dir=`xcrun -find -sdk ${platform} --show-sdk-path`
echo 
export CC=`xcrun -find -sdk iphoneos clang`
export CFLAGS="-Wno-error=implicit-function-declaration -arch ${arch} -pipe -Os -gdwarf-2 -isysroot ${platform_sdk_dir} ${extra_cflags} -stdlib=libc++"
export LDFLAGS="-arch ${arch} -isysroot ${platform_sdk_dir}"
export CXX=`xcrun -find -sdk iphoneos clang++`
export CXXFLAGS="${CFLAGS}"
export CXXCPP="${CXX}" 
export PREFIX_PROJ=$PWD/proj4
echo $PREFIX_PROJ/$arch
mkdir -p $PREFIX_PROJ/$arch
export INCLUDE_LOCATION=$PWD/proj-4.8.0/src
cd proj-4.8.0/src
pwd
rm PJ_aeqd.o
make -f makefile.custom
rm libproj.a
ar -rv libproj.a *.o
cp libproj.a $PREFIX_PROJ/$arch
cd ..
cd ..
