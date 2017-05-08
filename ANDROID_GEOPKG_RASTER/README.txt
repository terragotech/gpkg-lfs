README
=======
This file specifies the instruction to build gdal and gpkg raster import for android devices.
The goal is to generate a share library for GeoPackage Raster import as .so file.

The shared libgeopkgraster.so is called via jni call on the android code. Platform specific code is generated and placed in folder named with platform name under jni folder.

Steps to build the libgeopkgraster.so

1. cd android-geopkg-raster

2. Check if android-ndk-r14b folder exists in this folder, if not generate it by extracting the archive

unzip android-ndk-r14b-darwin-x86_64.zip

3. Generate compiler tools for each specific target

./all-tools.sh android-ndk-r14b android-21

4. Build proj4 and sqlite which is dependent for building GDAL
./build-proj-sqlite.sh android-ndk-r14b

5. Build GDAL 

./build-gdal-arm64.sh $PWD/android-21-arm64 $PWD

./build-gdal-armeabi-v7a.sh $PWD/android-21-arm $PWD

./build-gdal-armeabi.sh $PWD/android-21-arm $PWD

./build-gdal-mips.sh $PWD/android-21-mips $PWD

./build-gdal-mips64.sh $PWD/android-21-mips64 $PWD

./build-gdal-x86.sh $PWD/android-21-x86 $PWD

./build-gdal-x86_64.sh $PWD/android-21-x86_64 $PWD


6. Build libgeopkgraster.so
[Get the result of pwd, copy the path and use it at step ]

cd ..
pwd

e.g. of result of pwd
/Users/vishsubramanian/ANDROID_GEOPKG_RASTER

cd geopackage-raster/


./build-all-geopkg-raster.sh /Users/vishsubramanian/ANDROID_GEOPKG_RASTER/android-geopkg-raster   /Users/vishsubramanian/ANDROID_GEOPKG_RASTER/android-geopkg-raster/android-ndk-r14b

Result of all the android libs will be available at geopackage-raster/mlibs

