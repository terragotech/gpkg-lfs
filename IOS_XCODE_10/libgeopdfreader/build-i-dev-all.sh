#!/bin/sh
for f in "armv7" "armv7s" "arm64"; do
echo Building $f
#Build for iPhone
export platform=iphoneos 
export arch=$f
export platform_dir=`xcrun -find -sdk ${platform} --show-sdk-platform-path`
platform_sdk_dir=`xcrun -find -sdk ${platform} --show-sdk-path`

#setup compiler flags

export CC=`xcrun -find -sdk iphoneos clang`
export CFLAGS="-Wno-error=implicit-function-declaration -arch ${arch} -pipe -Os -gdwarf-2 -isysroot ${platform_sdk_dir} ${extra_cflags} -stdlib=libc++"
export LDFLAGS="-arch ${arch} -isysroot ${platform_sdk_dir}"
export CXX=`xcrun -find -sdk iphoneos clang++`
export CXXFLAGS="${CFLAGS}"

echo ${platform_dir}
echo ${platform_sdk_dir}

echo CC ${CC}
echo C++ ${CXX}
echo LDFLAGS ${LDFLAGS}
export host="${arch}-apple-darwin"
if [ $f = "arm64" ]
	then
Building for Arm64 Bit
export host="arm-apple-darwin"
fi
echo Host:${host}
echo CPP Options:${CXXFLAGS}
#############PDFIUM Cross Compiler######################
export AS=`xcrun -find -sdk iphoneos as`
export AR=`xcrun -find -sdk iphoneos ar`
export LD=`xcrun -find -sdk iphoneos ld`
export NM=`xcrun -find -sdk iphoneos nm`
export RANLIB=`xcrun -find -sdk iphoneos ranlib`
#############END OF PDFIUM Cross Compiler ##############
export TPF=$1
make -f make-device-all clean
make -f make-device-all ${f} 

done
