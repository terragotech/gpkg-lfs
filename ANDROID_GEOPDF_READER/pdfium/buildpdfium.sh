#!/bin/bash 
export PATH=$PATH:/home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/android-30-arm64/bin
make -f buildfdrm.mk clean
make -f buildfdrm.mk 
make -f buildfdpdfdoc.mk clean
make -f buildfdpdfdoc.mk
make -f buildfpdftext.mk clean
make -f buildfpdftext.mk
make -f buildfxcodec.mk clean
make -f buildfxcodec.mk
make -f buildfxcrt.mk clean
make -f buildfxcrt.mk 
make -f buildfxge.mk clean
make -f buildfxge.mk
make -f buildfpdfapi.mk clean
make -f buildfpdfapi.mk
make -f buildformbuilder.mk clean
make -f buildformbuilder.mk
make -f buildpdfwin.mk clean
make -f buildpdfwin.mk
make -f buildpdfwin.mk clean
make -f buildpdfwin.mk
make -f buildlibpdfium.mk clean
make -f buildlibpdfium.mk
make -f buildfdpdfdoc.mk clean
make -f buildfdpdfdoc.mk
make -f buildfdrm.mk clean
make -f buildfdrm.mk
make -f buildfxedit.mk clean
make -f buildfxedit.mk
make -f buildfxcrt.mk clean
make -f buildfxcrt.mk
aarch64-linux-android-ar rcs liballpdfium.a *.o
