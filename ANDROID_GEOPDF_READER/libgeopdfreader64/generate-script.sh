#!/bin/bash
 
export TP=$1
export TG=$2
export BUILD_FOLDER='./jni'

echo 'APP_ABI := '$2 > $BUILD_FOLDER/Application.mk
echo 'APP_PLATFORM := android-30' >> $BUILD_FOLDER/Application.mk
echo 'APP_STL := c++_shared' >> $BUILD_FOLDER/Application.mk
echo 'LOCAL_PATH := $(call my-dir)' > $BUILD_FOLDER/Android.mk
echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_MODULE := gdal' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SRC_FILES := '$TP'/'$TG'/lib/libgdal.a' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/Android.mk
echo 'include $(PREBUILT_STATIC_LIBRARY)' >> $BUILD_FOLDER/Android.mk

echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_MODULE := sqlite' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SRC_FILES := '$TP'/'$TG'/lib/libsqlite3.a' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/Android.mk
echo 'include $(PREBUILT_STATIC_LIBRARY)' >> $BUILD_FOLDER/Android.mk

echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_MODULE := proj4' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SRC_FILES := '$TP'/'$TG'/lib/libproj.a'  >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/Android.mk
echo 'include $(PREBUILT_STATIC_LIBRARY)' >> $BUILD_FOLDER/Android.mk

echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_MODULE := fxcrt' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SRC_FILES := '$TP'/'$TG'/pdfium/install/lib/pdfium/libfxcrt.a' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/Android.mk
echo 'include $(PREBUILT_STATIC_LIBRARY)' >> $BUILD_FOLDER/Android.mk

echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_MODULE := fxedit' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SRC_FILES := '$TP'/'$TG'/pdfium/install/lib/pdfium/libfxedit.a' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/Android.mk
echo 'include $(PREBUILT_STATIC_LIBRARY)' >> $BUILD_FOLDER/Android.mk

echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_MODULE := fxge' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SRC_FILES := '$TP'/'$TG'/pdfium/install/lib/pdfium/libfxge.a' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/Android.mk
echo 'include $(PREBUILT_STATIC_LIBRARY)' >> $BUILD_FOLDER/Android.mk

echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_MODULE := pdfwindow' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SRC_FILES := '$TP'/'$TG'/pdfium/install/lib/pdfium/libpdfwindow.a'  >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/Android.mk
echo 'include $(PREBUILT_STATIC_LIBRARY)' >> $BUILD_FOLDER/Android.mk

echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_MODULE := fdrm' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SRC_FILES :='$TP'/'$TG'/pdfium/install/lib/pdfium/libfdrm.a ' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/Android.mk
echo 'include $(PREBUILT_STATIC_LIBRARY)' >> $BUILD_FOLDER/Android.mk

echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_MODULE := fpdfdoc' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SRC_FILES := '$TP'/'$TG'/pdfium/install/lib/pdfium/libfpdfdoc.a' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/Android.mk
echo 'include $(PREBUILT_STATIC_LIBRARY)' >> $BUILD_FOLDER/Android.mk

echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_MODULE := fpdfapi' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SRC_FILES := '$TP'/'$TG'/pdfium/install/lib/pdfium/libfpdfapi.a'  >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/Android.mk
echo 'include $(PREBUILT_STATIC_LIBRARY)' >> $BUILD_FOLDER/Android.mk

echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_MODULE := fpdftext' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SRC_FILES := '$TP'/'$TG'/pdfium/install/lib/pdfium/libfpdftext.a'  >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/Android.mk
echo 'include $(PREBUILT_STATIC_LIBRARY)' >> $BUILD_FOLDER/Android.mk

echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_MODULE := formfiller' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SRC_FILES := '$TP'/'$TG'/pdfium/install/lib/pdfium/libformfiller.a'  >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/Android.mk
echo 'include $(PREBUILT_STATIC_LIBRARY)' >> $BUILD_FOLDER/Android.mk

echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_MODULE := fxcodec' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SRC_FILES := '$TP'/'$TG'/pdfium/install/lib/pdfium/libfxcodec.a'  >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/Android.mk
echo 'include $(PREBUILT_STATIC_LIBRARY)' >> $BUILD_FOLDER/Android.mk
echo ''
echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_MODULE := freetype' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SRC_FILES := '$TP'/'$TG'/pdfium/install/lib/pdfium/libfreetype.a'  >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/Android.mk
echo 'include $(PREBUILT_STATIC_LIBRARY)' >> $BUILD_FOLDER/Android.mk

echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_MODULE := bigint' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SRC_FILES := '$TP'/'$TG'/pdfium/install/lib/pdfium/libbigint.a'  >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/Android.mk
echo 'include $(PREBUILT_STATIC_LIBRARY)' >> $BUILD_FOLDER/Android.mk

echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_MODULE := pdfium' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SRC_FILES := '$TP'/'$TG'/pdfium/install/lib/pdfium/libpdfium.a' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/Android.mk
echo 'include $(PREBUILT_STATIC_LIBRARY)' >> $BUILD_FOLDER/Android.mk

echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_MODULE := fx_libopenjpeg' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SRC_FILES := '$TP'/'$TG'/pdfium/install/lib/pdfium/libfx_libopenjpeg.a' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/Android.mk
echo 'include $(PREBUILT_STATIC_LIBRARY)' >> $BUILD_FOLDER/Android.mk

echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_MODULE := fx_lcms2' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SRC_FILES := '$TP'/'$TG'/pdfium/install/lib/pdfium/libfx_lcms2.a' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/Android.mk
echo 'include $(PREBUILT_STATIC_LIBRARY)' >> $BUILD_FOLDER/Android.mk

echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_MODULE := fx_libjpeg' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SRC_FILES := '$TP'/'$TG'/pdfium/install/lib/pdfium/libfx_libjpeg.a' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/Android.mk
echo 'include $(PREBUILT_STATIC_LIBRARY)' >> $BUILD_FOLDER/Android.mk

echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_MODULE := fx_agg' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SRC_FILES := '$TP'/'$TG'/pdfium/install/lib/pdfium/libfx_agg.a' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/Android.mk
echo 'include $(PREBUILT_STATIC_LIBRARY)' >> $BUILD_FOLDER/Android.mk

echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_MODULE := fx_zlib' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SRC_FILES := '$TP'/'$TG'/pdfium/install/lib/pdfium/libfx_zlib.a' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/Android.mk
echo 'include $(PREBUILT_STATIC_LIBRARY)' >> $BUILD_FOLDER/Android.mk

echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_MODULE := shgdal' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SRC_FILES := '$TP'/'$TG'/lib/libgdal210.so' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/Android.mk
echo 'include $(PREBUILT_SHARED_LIBRARY)' >> $BUILD_FOLDER/Android.mk

echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_MODULE := geopdfreader' >> $BUILD_FOLDER/Android.mk

echo 'LOCAL_SRC_FILES := gdal_to_tiles.cpp gdalwarp_bin.cpp gdalwarp_bin21.cpp global_mercator.cpp logger.cpp logger2.cpp main.cpp utils.cpp GeoPDFReader.cpp com_terragoedge_geopdf_read_GeoPDFReader.cpp ' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_C_INCLUDES := '$TP'/'$TG'/include  '$TP'/gdalh $(LOCAL_PATH)/png' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_STATIC_LIBRARIES := gdal sqlite proj4 fpdfapi fpdfdoc pdfium  fpdftext formfiller pdfwindow fxedit  fxcodec fx_libopenjpeg fx_lcms2 fx_libjpeg fx_zlib fdrm fxge freetype fx_agg fxcrt bigint' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SHARED_LIBRARIES := shgdal' >> $BUILD_FOLDER/Android.mk
echo 'include $(BUILD_SHARED_LIBRARY)' >> $BUILD_FOLDER/Android.mk
