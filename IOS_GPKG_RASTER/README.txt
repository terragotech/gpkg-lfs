Building Instructions for building GDAL for IOS iPhone and iPad

This build for GDAL is a minimal Build customized from the original gdal2.1.0 src
distribution, there have been changes in the make files and build option files and small changes in the OGR source to make sure the GDAL builds for all
these targets (arm7, arm7s,arm64,i386,x86_64)

genoptalltargets.sh and generateModifiedOpt.sh
generates GDALMake.opt and has a backup in architecture specific folder.


build-gdal-combined-lib.sh and build_gdal_ios.sh generates the libgdal.a




Customizing the GDAL build for specific targets
===============================================
Make changes in build-gdal-combined-lib.sh line 17, 23, 31, 40 as for the required targets 
(e.g for f in "armv7" "armv7s"; do ) 
as per the example in previous line will generate armv7 and armv7s only
and then Follow the Building Instruction given in following text



Building Instructions
=====================

Step 1: Open the Terminal on Mac
Step 2: expects these files genoptalltargets.sh, generateModifiedOpt.sh, build-gdal-combined-lib.sh, build_gdal_ios.sh, gdal-2.1.0 (folder) and proj-4.8.0 (folder)

Step 3: execute genoptalltargets.sh
	This will generate folders armv7, armv7s, arm64, i386, X86_64 inside gdal-2.1.0

After the execution of genoptalltargets.sh, GDALmake.opt will be created in gdal-2.1.0/armv7,gdal-2.1.0/armv7s,gdal-2.1.0/arm64,gdal-2.1.0/i386,gdal-2.1.0/X86_64


Step 4: 
Now go to these folder gdal-2.1.0/armv7,gdal-2.1.0/armv7s,gdal-2.1.0/arm64,gdal-2.1.0/i386,gdal-2.1.0/X86_64
one at time and open GDALmake.opt look for the line GDAL_FORMATS :=

make changes such as it should finally resemble as this

GDAL_FORMATS :=
GDAL_FORMATS :=
GDAL_FORMATS +=  gtiff hfa jpeg png zlib raw mem vrt


Step 5: execute build-gdal-combined-lib.sh

Final build is available at install folder.


Building Instructions for libGeoPackageRasterReader
===================================================

Follow instructions in README.txt at geopackageraster_lib