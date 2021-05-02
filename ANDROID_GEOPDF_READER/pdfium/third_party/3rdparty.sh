#!/bin/bash
export PATH=$PATH:/home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/android-30-arm64/bin
cd freetype
make -f libfreetype.mk clean
make -f libfreetype.mk 
cd ..
cd bigint
make -f bigint.mk clean
make -f bigint.mk 
cd ..
cd agg23
make -f agg.mk clean
make -f agg.mk 
cd ..
cd lcms2-2.6
make -f lcms.mk clean
make -f lcms.mk
cd ..
cd libjpeg
make -f libjpeg.mk clean
make -f libjpeg.mk
cd ..
cd libopenjpeg20
make -f libopenjpeg.mk clean
make -f libopenjpeg.mk
cd ..
cd zlib_v128
make -f libzlib.mk clean
make -f libzlib.mk
cd ..
