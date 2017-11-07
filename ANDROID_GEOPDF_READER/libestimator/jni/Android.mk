LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := gdal
LOCAL_SRC_FILES := /home/ganesan/works/ANDROID_PDFIUM/mips64/lib/libgdal.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := sqlite
LOCAL_SRC_FILES := /home/ganesan/works/ANDROID_PDFIUM/mips64/lib/libsqlite3.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := proj4
LOCAL_SRC_FILES := /home/ganesan/works/ANDROID_PDFIUM/mips64/lib/libproj.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := shgdal
LOCAL_SRC_FILES := /home/ganesan/works/ANDROID_PDFIUM/mips64/lib/libgdal210.so
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_SHARED_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := estimator
LOCAL_SRC_FILES := RasterSizeEstimator.cpp com_terragoedge_geopdf_read_GeoPDFEstimate.cpp
LOCAL_C_INCLUDES := /home/ganesan/works/ANDROID_PDFIUM/mips64/include  /home/ganesan/works/ANDROID_PDFIUM/gdalh $(LOCAL_PATH)/png
LOCAL_STATIC_LIBRARIES := gdal sqlite proj4 
LOCAL_SHARED_LIBRARIES := shgdal
include $(BUILD_SHARED_LIBRARY)
