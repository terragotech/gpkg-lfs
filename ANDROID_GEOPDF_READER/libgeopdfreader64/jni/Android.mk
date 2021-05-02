LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := gdal
LOCAL_SRC_FILES := /home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/arm64-v8a/lib/libgdal.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := sqlite
LOCAL_SRC_FILES := /home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/arm64-v8a/lib/libsqlite3.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := proj4
LOCAL_SRC_FILES := /home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/arm64-v8a/lib/libproj.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := fxcrt
LOCAL_SRC_FILES := /home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/arm64-v8a/pdfium/install/lib/pdfium/libfxcrt.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := fxedit
LOCAL_SRC_FILES := /home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/arm64-v8a/pdfium/install/lib/pdfium/libfxedit.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := fxge
LOCAL_SRC_FILES := /home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/arm64-v8a/pdfium/install/lib/pdfium/libfxge.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := pdfwindow
LOCAL_SRC_FILES := /home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/arm64-v8a/pdfium/install/lib/pdfium/libpdfwindow.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := fdrm
LOCAL_SRC_FILES :=/home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/arm64-v8a/pdfium/install/lib/pdfium/libfdrm.a 
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := fpdfdoc
LOCAL_SRC_FILES := /home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/arm64-v8a/pdfium/install/lib/pdfium/libfpdfdoc.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := fpdfapi
LOCAL_SRC_FILES := /home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/arm64-v8a/pdfium/install/lib/pdfium/libfpdfapi.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := fpdftext
LOCAL_SRC_FILES := /home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/arm64-v8a/pdfium/install/lib/pdfium/libfpdftext.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := formfiller
LOCAL_SRC_FILES := /home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/arm64-v8a/pdfium/install/lib/pdfium/libformfiller.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := fxcodec
LOCAL_SRC_FILES := /home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/arm64-v8a/pdfium/install/lib/pdfium/libfxcodec.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := freetype
LOCAL_SRC_FILES := /home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/arm64-v8a/pdfium/install/lib/pdfium/libfreetype.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := bigint
LOCAL_SRC_FILES := /home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/arm64-v8a/pdfium/install/lib/pdfium/libbigint.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := pdfium
LOCAL_SRC_FILES := /home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/arm64-v8a/pdfium/install/lib/pdfium/libpdfium.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := fx_libopenjpeg
LOCAL_SRC_FILES := /home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/arm64-v8a/pdfium/install/lib/pdfium/libfx_libopenjpeg.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := fx_lcms2
LOCAL_SRC_FILES := /home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/arm64-v8a/pdfium/install/lib/pdfium/libfx_lcms2.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := fx_libjpeg
LOCAL_SRC_FILES := /home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/arm64-v8a/pdfium/install/lib/pdfium/libfx_libjpeg.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := fx_agg
LOCAL_SRC_FILES := /home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/arm64-v8a/pdfium/install/lib/pdfium/libfx_agg.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := fx_zlib
LOCAL_SRC_FILES := /home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/arm64-v8a/pdfium/install/lib/pdfium/libfx_zlib.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := shgdal
LOCAL_SRC_FILES := /home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/arm64-v8a/lib/libgdal210.so
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_SHARED_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := geopdfreader64
LOCAL_SRC_FILES := gdal_to_tiles.cpp gdalwarp_bin.cpp gdalwarp_bin21.cpp global_mercator.cpp logger.cpp logger2.cpp main.cpp utils.cpp GeoPDFReader.cpp com_terragoedge_geopdf_read_GeoPDFReader.cpp 
LOCAL_C_INCLUDES := /home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/arm64-v8a/include  /home/android-build/gpkg-lfs/ANDROID_GEOPDF_READER/gdalh $(LOCAL_PATH)/png
LOCAL_STATIC_LIBRARIES := gdal sqlite proj4 fpdfapi fpdfdoc pdfium  fpdftext formfiller pdfwindow fxedit  fxcodec fx_libopenjpeg fx_lcms2 fx_libjpeg fx_zlib fdrm fxge freetype fx_agg fxcrt bigint
LOCAL_SHARED_LIBRARIES := shgdal
include $(BUILD_SHARED_LIBRARY)
