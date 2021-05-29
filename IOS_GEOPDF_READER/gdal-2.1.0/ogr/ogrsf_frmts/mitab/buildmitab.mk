INCLUDE=-I. -I.. -I../../../port -I../../ -I../../../gcore -I./libjson -I../../../apps
OBJ = mitab_rawbinblock.o mitab_mapheaderblock.o \
		mitab_mapindexblock.o mitab_mapobjectblock.o \
		mitab_mapcoordblock.o mitab_feature.o mitab_feature_mif.o \
		mitab_mapfile.o mitab_idfile.o mitab_datfile.o \
		mitab_tabfile.o mitab_miffile.o mitab_utils.o \
		mitab_imapinfofile.o mitab_middatafile.o mitab_bounds.o \
		mitab_maptoolblock.o mitab_tooldef.o mitab_coordsys.o \
		mitab_spatialref.o mitab_ogr_driver.o mitab_indfile.o \
		mitab_tabview.o mitab_ogr_datasource.o mitab_geometry.o \
		mitab_tabseamless.o

EXTRAFLAGS = -DOGR -DMITAB_USE_OFTDATETIME	
%.o: %.cpp
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) -o $@ $<
	

libmitab.a: $(OBJ)
	ar rcs libmitab.a *.o

clean:
	rm -f libmitab.a
	rm -f *.o
	