include $(CLEAR_VARS)
LOCAL_MODULE := gdal
LOCAL_SRC_FILES := /Users/vishsubramanian/ANDROID_GEOPKG_RASTER/android-geopkg-raster/x86_64/lib/libgdal.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
 
include $(CLEAR_VARS)
LOCAL_MODULE := sqlite
LOCAL_SRC_FILES := /Users/vishsubramanian/ANDROID_GEOPKG_RASTER/android-geopkg-raster/x86_64/lib/libsqlite3.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
 
include $(CLEAR_VARS)
LOCAL_MODULE := proj4
LOCAL_SRC_FILES := /Users/vishsubramanian/ANDROID_GEOPKG_RASTER/android-geopkg-raster/x86_64/lib/libproj.a
LOCAL_EXPORT_LDLIBS := -lz
include $(PREBUILT_STATIC_LIBRARY)
 
include $(CLEAR_VARS)
LOCAL_MODULE := geopkgraster
LOCAL_SRC_FILES := hellogdal.cpp gdalwarp_bin.cpp GeoPackageRasterReader.cpp com_terragoedge_geopkg_read_GeoPackageRasterReader.cpp utils.cpp main.cpp logger2.cpp logger.cpp global_mercator.cpp gdal_to_tiles.cpp
LOCAL_C_INCLUDES := /Users/vishsubramanian/ANDROID_GEOPKG_RASTER/android-geopkg-raster/x86_64/include  $(LOCAL_PATH)/png
LOCAL_STATIC_LIBRARIES := gdal sqlite proj4
include $(BUILD_SHARED_LIBRARY)
 
