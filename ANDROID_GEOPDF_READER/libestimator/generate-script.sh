#!/bin/bash
 
export TP=$1
export TG=$2
export BUILD_FOLDER='./jni'

echo 'APP_ABI := '$2 > $BUILD_FOLDER/Application.mk
echo 'APP_PLATFORM := android-21' >> $BUILD_FOLDER/Application.mk
echo 'APP_STL := gnustl_static' >> $BUILD_FOLDER/Application.mk
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
echo 'LOCAL_MODULE := shgdal' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SRC_FILES := '$TP'/'$TG'/lib/libgdal210.so' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/Android.mk
echo 'include $(PREBUILT_SHARED_LIBRARY)' >> $BUILD_FOLDER/Android.mk

echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_MODULE := estimator' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SRC_FILES := RasterSizeEstimator.cpp com_terragoedge_geopdf_read_GeoPDFEstimate.cpp' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_C_INCLUDES := '$TP'/'$TG'/include  '$TP'/gdalh $(LOCAL_PATH)/png' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_STATIC_LIBRARIES := gdal sqlite proj4 ' >> $BUILD_FOLDER/Android.mk
echo 'LOCAL_SHARED_LIBRARIES := shgdal' >> $BUILD_FOLDER/Android.mk
echo 'include $(BUILD_SHARED_LIBRARY)' >> $BUILD_FOLDER/Android.mk
