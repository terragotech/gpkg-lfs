#!/bin/sh
#This script builds pdfium libray for iosDevice
cp ./pdfium_gyp_scripts/pdfium.simulator ./pdfium/pdfium.gyp
cp ./pdfium_gyp_scripts/third_party.simulator ./pdfium/third_party/third_party.gyp
cd pdfium

./build/gyp_pdfium

# pdfium.xcodeproj
xcodebuild -configuration Release_x64 ENABLE_BITCODE=NO\
  -target pdfium \
  -target fdrm \
  -target fpdfdoc \
  -target fpdfapi \
  -target fpdftext \
  -target fxcodec \
  -target fxcrt \
  -target fxge \
  -target fxedit \
  -target pdfwindow \
  -target formfiller

# third_party.xcodeproj
cd third_party
xcodebuild -configuration Release_x64 ENABLE_BITCODE=NO\
  -target bigint \
  -target freetype \
  -target fx_agg \
  -target fx_lcms2 \
  -target fx_zlib \
  -target pdfium_base \
  -target fx_libjpeg \
  -target fx_libopenjpeg
cd ..
cd ..
mkdir -p $PWD/sim_bin/
cp ./pdfium/xcodebuild/Release_x64-iphonesimulator/* $PWD/sim_bin/


