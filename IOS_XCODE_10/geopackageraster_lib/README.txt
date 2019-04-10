README
=======

Building instructions for libGeoPackageRasterReader.a

enter the geopackageraster_lib folder

Run the following script to generate the libGeoPackageRasterReader.a

./build-geopkg-raster-all.sh 

once the script execution is complete look for libGeoPackageRasterReader.a
at current working folder geopackageraster_lib

This libGeoPackageRasterReader.a will used in Xcode along with libgdal.a and libproj.a.

For generating libgdal.a and libproj.a look for README.txt in the parent folder of geopackageraster_lib and follow those instructions



Customising the build
=====================
To limit the build to few targets try change the for loop elements in line 17 and line 23 of build-geopkg-raster-all.sh
and make changes as required on line 28
