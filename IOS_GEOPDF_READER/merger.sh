rm -f ./gdal-2.1.0/frmts/allobjs/*.o
rm -f libgdal.a
cp ./gdal-2.1.0/ogr/ogrsf_frmts/o/* ./gdal-2.1.0/frmts/allobjs
cp ./gdal-2.1.0/frmts/o/* ./gdal-2.1.0/frmts/allobjs
ar rcs libgdal.a ./gdal-2.1.0/frmts/allobjs/*.o
