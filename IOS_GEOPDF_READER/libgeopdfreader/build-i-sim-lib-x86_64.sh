#!/bin/sh
#Build for iPhone Simulator
export platform=iphonesimulator
#export platform=iphoneos 
###Build for Device###
for f in "x86_64" "i386"; do
export arch=$f
export platform_dir=`xcrun -find -sdk ${platform} --show-sdk-platform-path`
platform_sdk_dir=`xcrun -find -sdk ${platform} --show-sdk-path`


#setup compiler flags

export CC=`xcrun -find -sdk iphoneos gcc`
export CFLAGS="-Wno-error=implicit-function-declaration -arch ${arch} -pipe -Os -gdwarf-2 -isysroot ${platform_sdk_dir} ${extra_cflags} -stdlib=libstdc++"
export LDFLAGS="-arch ${arch} -isysroot ${platform_sdk_dir}"
export CXX=`xcrun -find -sdk iphoneos g++`
export CXXFLAGS="${CFLAGS} -g"
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
export TPF=$1
make -f make-sim-x864_64 clean
make -f make-sim-x864_64 ${f}
done
