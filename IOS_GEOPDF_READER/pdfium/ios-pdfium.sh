#!/bin/bash
export platform=iphoneos
export arch="arm64"
export platform_dir=`xcrun -find -sdk ${platform} --show-sdk-platform-path`
platform_sdk_dir=`xcrun -find -sdk ${platform} --show-sdk-path`
export CC=`xcrun -find -sdk iphoneos clang`
export CFLAGS=" -stdlib=libc++ -Wno-error=implicit-function-declaration -arch ${arch} -pipe -Os -gdwarf-2 -isysroot ${platform_sdk_dir} ${extra_cflags} -c"
export LDFLAGS="-arch ${arch} -isysroot ${platform_sdk_dir}"
export CPP=`xcrun -find -sdk iphoneos clang++ `
export CXXFLAGS="${CFLAGS} -std=c++11 -lc++abi"
export CXX=`xcrun -find -sdk iphoneos cpp`
export CXX1CPP="${CPP}"
echo ${platform_dir}
echo ${platform_sdk_dir}
echo CC ${CC}
echo C++ ${CXX}
echo LDFLAGS ${LDFLAGS}
export host="arm-apple-darwin"
make -f buildfdpdfdoc.mk clean
make -f buildfdpdfdoc.mk
make -f buildfdrm.mk clean
make -f buildfdrm.mk
make -f buildformbuilder.mk clean
make -f buildformbuilder.mk 
make -f buildfpdfapi.mk clean
make -f buildfpdfapi.mk
make -f buildfpdftext.mk clean
make -f buildfpdftext.mk
make -f buildlibpdfium.mk clean
make -f buildlibpdfium.mk
make -f buildfxcrt.mk clean
make -f buildfxcrt.mk
make -f buidlfxedit.mk clean
make -f buildfxedit.mk
make -f buildpdfwin.mk clean
make -f buildpdfwin.mk
make -f buildfxcodec.mk clean
make -f buildfxcodec.mk
make -f buildfxge.mk clean
make -f buildfxge.mk
