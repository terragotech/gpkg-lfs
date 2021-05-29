INCLUDE=-I. -I../ogr/ogrsf_frmts -I../alg -I../ogr/ogrsf_frmts/geojson/libjson -I../port -I../frmts/gtiff -I../frmts/mem -I../frmts/vrt -I../ogr -I../ogr/ogrsf_frmts/generic -I../gnm/ -I../gnm/gnm_frmts/ $(JSON_INCLUDE) -I../ogr/ogrsf_frmts/geojson
CXXFLAGS := $(CXXFLAGS) -DRENAME_INTERNAL_LIBTIFF_SYMBOLS -DSQLITE_ENABLED
libgcore.a: gdalopeninfo.cpp gdaldrivermanager.cpp gdaldriver.cpp gdaldataset.cpp gdalrasterband.cpp gdal_misc.cpp rasterio.cpp gdalrasterblock.cpp gdalcolortable.cpp gdalmajorobject.cpp overview.cpp gdaldefaultoverviews.cpp gdalpamdataset.cpp gdalpamrasterband.cpp gdaljp2metadata.cpp gdaljp2box.cpp gdalmultidomainmetadata.cpp gdal_rat.cpp gdalgmlcoverage.cpp gdalpamproxydb.cpp gdalallvalidmaskband.cpp gdalnodatamaskband.cpp gdalproxydataset.cpp gdalproxypool.cpp gdaldefaultasync.cpp gdalnodatavaluesmaskband.cpp gdaldllmain.cpp gdalexif.cpp gdalclientserver.cpp gdalgeorefpamdataset.cpp gdaljp2abstractdataset.cpp gdalvirtualmem.cpp gdaloverviewdataset.cpp gdalrescaledalphaband.cpp gdaljp2structure.cpp gdal_mdreader.cpp gdaljp2metadatagenerator.cpp gdalabstractbandblockcache.cpp gdalarraybandblockcache.cpp gdalhashsetbandblockcache.cpp

	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdalopeninfo.cpp		-o	gdalopeninfo.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdaldrivermanager.cpp		-o	gdaldrivermanager.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdaldriver.cpp		-o	gdaldriver.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdaldataset.cpp		-o	gdaldataset.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdalrasterband.cpp		-o	gdalrasterband.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdal_misc.cpp		-o	gdal_misc.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		rasterio.cpp		-o	rasterio.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdalrasterblock.cpp		-o	gdalrasterblock.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdalcolortable.cpp		-o	gdalcolortable.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdalmajorobject.cpp		-o	gdalmajorobject.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		overview.cpp		-o	overview.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdaldefaultoverviews.cpp		-o	gdaldefaultoverviews.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdalpamdataset.cpp		-o	gdalpamdataset.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdalpamrasterband.cpp		-o	gdalpamrasterband.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdaljp2metadata.cpp		-o	gdaljp2metadata.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdaljp2box.cpp		-o	gdaljp2box.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdalmultidomainmetadata.cpp		-o	gdalmultidomainmetadata.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdal_rat.cpp		-o	gdal_rat.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdalgmlcoverage.cpp		-o	gdalgmlcoverage.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdalpamproxydb.cpp		-o	gdalpamproxydb.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdalallvalidmaskband.cpp		-o	gdalallvalidmaskband.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdalnodatamaskband.cpp		-o	gdalnodatamaskband.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdalproxydataset.cpp		-o	gdalproxydataset.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdalproxypool.cpp		-o	gdalproxypool.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdaldefaultasync.cpp		-o	gdaldefaultasync.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdalnodatavaluesmaskband.cpp		-o	gdalnodatavaluesmaskband.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdaldllmain.cpp		-o	gdaldllmain.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdalexif.cpp		-o	gdalexif.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdalclientserver.cpp		-o	gdalclientserver.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdalgeorefpamdataset.cpp		-o	gdalgeorefpamdataset.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdaljp2abstractdataset.cpp		-o	gdaljp2abstractdataset.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdalvirtualmem.cpp		-o	gdalvirtualmem.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdaloverviewdataset.cpp		-o	gdaloverviewdataset.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdalrescaledalphaband.cpp		-o	gdalrescaledalphaband.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdaljp2structure.cpp		-o	gdaljp2structure.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdal_mdreader.cpp		-o	gdal_mdreader.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdaljp2metadatagenerator.cpp		-o	gdaljp2metadatagenerator.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdalabstractbandblockcache.cpp		-o	gdalabstractbandblockcache.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdalarraybandblockcache.cpp		-o	gdalarraybandblockcache.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		gdalhashsetbandblockcache.cpp		-o	gdalhashsetbandblockcache.o

clean:
	rm -f *.o
