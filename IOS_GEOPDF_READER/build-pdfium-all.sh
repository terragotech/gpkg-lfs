#!/bin/sh
#./build-pdfium-dev.sh
#./build-pdfium-sim.sh
PREFIX=$PWD/pdfiumBuild/all/pdfium
mkdir -p $PREFIX
mkdir -p $PREFIX/install/include
mkdir -p $PREFIX/install/include/pdfium/core/include
mkdir -p $PREFIX/install/lib
mkdir -p $PREFIX/install/lib/pdfium

sudo mkdir -p $PREFIX/install/include/pdfium/fpdfsdk/include
sudo mkdir -p $PREFIX/install/include/pdfium/core/include
sudo mkdir -p $PREFIX/install/include/pdfium/third_party/base/numerics
sudo mkdir -p $PREFIX/install/include/pdfium/public

cd pdfium
sudo cp -r public/*.h $PREFIX/install/include/pdfium/public/
sudo cp -r public/*.h $PREFIX/install/include/
sudo cp -r fpdfsdk/include/* $PREFIX/install/include/pdfium/fpdfsdk/include/
sudo cp -r core/include/* $PREFIX/install/include/pdfium/core/include
sudo cp -r third_party/base/numerics/* $PREFIX/install/include/pdfium/third_party/base/numerics
sudo cp -r third_party/base/* $PREFIX/install/include/pdfium/third_party/base/
           

lipo ./xcodebuild/Release_x64-iphoneos/libbigint.a  ./xcodebuild/Release_x64-iphonesimulator/libbigint.a   -output $PREFIX/install/lib/libbigint.a  -create
lipo ./xcodebuild/Release_x64-iphoneos/libfpdfapi.a  ./xcodebuild/Release_x64-iphonesimulator/libfpdfapi.a   -output $PREFIX/install/lib/libfpdfapi.a  -create
lipo ./xcodebuild/Release_x64-iphoneos/libfreetype.a  ./xcodebuild/Release_x64-iphonesimulator/libfreetype.a   -output $PREFIX/install/lib/libfreetype.a  -create
lipo ./xcodebuild/Release_x64-iphoneos/libfx_libjpeg.a  ./xcodebuild/Release_x64-iphonesimulator/libfx_libjpeg.a   -output $PREFIX/install/lib/libfx_libjpeg.a  -create
lipo ./xcodebuild/Release_x64-iphoneos/libfxcodec.a  ./xcodebuild/Release_x64-iphonesimulator/libfxcodec.a   -output $PREFIX/install/lib/libfxcodec.a  -create

lipo ./xcodebuild/Release_x64-iphoneos/libfxge.a  ./xcodebuild/Release_x64-iphonesimulator/libfxge.a   -output $PREFIX/install/lib/libfxge.a  -create
lipo ./xcodebuild/Release_x64-iphoneos/libfdrm.a  ./xcodebuild/Release_x64-iphonesimulator/libfdrm.a   -output $PREFIX/install/lib/libfdrm.a  -create
lipo ./xcodebuild/Release_x64-iphoneos/libfpdfdoc.a  ./xcodebuild/Release_x64-iphonesimulator/libfpdfdoc.a   -output $PREFIX/install/lib/libfpdfdoc.a  -create
lipo ./xcodebuild/Release_x64-iphoneos/libfx_agg.a   ./xcodebuild/Release_x64-iphonesimulator/libfx_agg.a    -output $PREFIX/install/lib/libfx_agg.a   -create
lipo ./xcodebuild/Release_x64-iphoneos/libfx_libopenjpeg.a   ./xcodebuild/Release_x64-iphonesimulator/libfx_libopenjpeg.a    -output $PREFIX/install/lib/libfx_libopenjpeg.a   -create
lipo ./xcodebuild/Release_x64-iphoneos/libfxcrt.a   ./xcodebuild/Release_x64-iphonesimulator/libfxcrt.a    -output $PREFIX/install/lib/libfxcrt.a   -create
lipo ./xcodebuild/Release_x64-iphoneos/libpdfium.a   ./xcodebuild/Release_x64-iphonesimulator/libpdfium.a    -output $PREFIX/install/lib/libpdfium.a   -create
lipo ./xcodebuild/Release_x64-iphoneos/libformfiller.a   ./xcodebuild/Release_x64-iphonesimulator/libformfiller.a    -output $PREFIX/install/lib/libformfiller.a   -create
lipo ./xcodebuild/Release_x64-iphoneos/libfpdftext.a   ./xcodebuild/Release_x64-iphonesimulator/libfpdftext.a    -output $PREFIX/install/lib/libfpdftext.a   -create
lipo ./xcodebuild/Release_x64-iphoneos/libfx_lcms2.a   ./xcodebuild/Release_x64-iphonesimulator/libfx_lcms2.a    -output $PREFIX/install/lib/libfx_lcms2.a   -create
lipo ./xcodebuild/Release_x64-iphoneos/libfx_zlib.a   ./xcodebuild/Release_x64-iphonesimulator/libfx_zlib.a    -output $PREFIX/install/lib/libfx_zlib.a   -create
lipo ./xcodebuild/Release_x64-iphoneos/libfxedit.a   ./xcodebuild/Release_x64-iphonesimulator/libfxedit.a    -output $PREFIX/install/lib/libfxedit.a   -create
lipo ./xcodebuild/Release_x64-iphoneos/libpdfwindow.a   ./xcodebuild/Release_x64-iphonesimulator/libpdfwindow.a    -output $PREFIX/install/lib/libpdfwindow.a   -create
cp $PREFIX/install/lib/*.a $PREFIX/install/lib/pdfium/





