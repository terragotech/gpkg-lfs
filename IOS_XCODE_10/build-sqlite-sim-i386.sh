#!/bin/sh
#Build for iPhone
export platform=iphonesimulator
export arch="i386"
export platform_dir=`xcrun -find -sdk ${platform} --show-sdk-platform-path`
export platform_sdk_dir=`xcrun -find -sdk ${platform} --show-sdk-path`
echo 
export CC=`xcrun -find -sdk iphoneos clang`
export CFLAGS="-Wno-error=implicit-function-declaration -arch ${arch} -pipe -Os -gdwarf-2 -isysroot ${platform_sdk_dir} ${extra_cflags} -stdlib=libc++"
export LDFLAGS="-arch ${arch} -isysroot ${platform_sdk_dir}"
export CXX=`xcrun -find -sdk iphoneos clang++`
export CXXFLAGS="${CFLAGS}"
export CXXCPP="${CXX}" 
export PREFIX_SQLITE=$PWD/sqlite3
echo $PREFIX_SQLITE/$arch
mkdir -p $PREFIX_SQLITE/$arch
export INCLUDE_LOCATION=$PWD/sqlite-autoconf-3190300/
cd sqlite-autoconf-3190300
pwd
rm *.o
make -f makefile.custom
rm libsqlite.a
ar -rv libsqlite.a *.o
cp libsqlite.a $PREFIX_SQLITE/$arch
cd ..
cd ..
