#!/bin/bash
if [ $# -lt 3 ]
then
   echo Bad parameters
else
echo $1
export BUILD_STATIC_LIB=$1/$2
export BUILD_FOLDER='./jni'
echo 'APP_ABI := '$2 > $BUILD_FOLDER/Application.mk
echo 'APP_PLATFORM := android-21' >> $BUILD_FOLDER/Application.mk
echo 'APP_STL := gnustl_static' >> $BUILD_FOLDER/Application.mk


echo 'include $(CLEAR_VARS)' > $BUILD_FOLDER/gdal.mk
echo 'LOCAL_MODULE := gdal' >> $BUILD_FOLDER/gdal.mk
echo 'LOCAL_SRC_FILES := '$BUILD_STATIC_LIB'/lib/libgdal.a' >> $BUILD_FOLDER/gdal.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/gdal.mk
echo 'include $(PREBUILT_STATIC_LIBRARY)' >> $BUILD_FOLDER/gdal.mk
echo ' ' >> $BUILD_FOLDER/gdal.mk
echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/gdal.mk
echo 'LOCAL_MODULE := sqlite' >> $BUILD_FOLDER/gdal.mk
echo 'LOCAL_SRC_FILES := '$BUILD_STATIC_LIB'/lib/libsqlite3.a' >> $BUILD_FOLDER/gdal.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/gdal.mk
echo 'include $(PREBUILT_STATIC_LIBRARY)' >> $BUILD_FOLDER/gdal.mk
echo ' ' >> $BUILD_FOLDER/gdal.mk
echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/gdal.mk
echo 'LOCAL_MODULE := proj4' >> $BUILD_FOLDER/gdal.mk
echo 'LOCAL_SRC_FILES := '$BUILD_STATIC_LIB'/lib/libproj.a' >> $BUILD_FOLDER/gdal.mk
echo 'LOCAL_EXPORT_LDLIBS := -lz' >> $BUILD_FOLDER/gdal.mk
echo 'include $(PREBUILT_STATIC_LIBRARY)' >> $BUILD_FOLDER/gdal.mk
echo ' ' >> $BUILD_FOLDER/gdal.mk
echo 'include $(CLEAR_VARS)' >> $BUILD_FOLDER/gdal.mk
echo 'LOCAL_MODULE := geopkgraster' >> $BUILD_FOLDER/gdal.mk

echo 'LOCAL_SRC_FILES := hellogdal.cpp gdalwarp_bin.cpp GeoPackageRasterReader.cpp com_terragoedge_geopkg_read_GeoPackageRasterReader.cpp utils.cpp main.cpp logger2.cpp logger.cpp global_mercator.cpp gdal_to_tiles.cpp' >> $BUILD_FOLDER/gdal.mk


echo 'LOCAL_C_INCLUDES := '$BUILD_STATIC_LIB'/include  $(LOCAL_PATH)/png' >> $BUILD_FOLDER/gdal.mk
echo 'LOCAL_STATIC_LIBRARIES := gdal sqlite proj4' >> $BUILD_FOLDER/gdal.mk
#echo 'LOCAL_LDLIBS := -lgdal -lsqlite -lproj'
#echo 'LOCAL_STATIC_LIBRARIES := gdal sqlite proj4' >> $BUILD_FOLDER/gdal.mk
echo 'include $(BUILD_SHARED_LIBRARY)' >> $BUILD_FOLDER'/gdal.mk'
echo ' ' >> $BUILD_FOLDER/gdal.mk
export PATH=$PATH:$3
export NDK_PROJECT_PATH=$PWD
ndk-build
fi

