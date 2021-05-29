INCLUDE = -I./gdal-2.1.0 -I./gdal-2.1.0/gcore -I./gdal-2.1.0/port -I./gdal-2.1.0/ogr -I./gdal-2.1.0/ogr/ogrsf_frmts
EXTRAFLAGS = -lc++abi -L. -lgdal -L./sqlite3Build/arm64/lib -lsqlite3 -L./proj4/arm64/lib -lproj -L./pdfiumBuild/device/pdfium/install/lib -lfpdfapi -lfx_libopenjpeg -lfx_libjpeg -lfxcodec -lpdfium -lbigint -lfdrm -lformfiller  -lfpdfdoc -lfreetype -lfx_agg -lfx_lcms2  -lfx_zlib  -lfxcrt -lfxedit -lfxge -lpdfwindow -framework CoreGraphics -framework CoreText -framework CoreFoundation -liconv -lz
gdaltest: gdaltest.cpp
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) gdaltest.cpp -o gdaltest
