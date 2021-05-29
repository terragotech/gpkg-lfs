INCLUDE=-I. -I.. -I../../../port -I../../ -I../../../gcore -I./libjson -I../../../apps
OBJ = ogrxplanedriver.o ogrxplanedatasource.o ogrxplanelayer.o ogr_xplane_geo_utils.o \
		ogr_xplane_reader.o ogr_xplane_apt_reader.o ogr_xplane_nav_reader.o \
 		ogr_xplane_fix_reader.o ogr_xplane_awy_reader.o

EXTRAFLAGS =
%.o: %.cpp
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) -o $@ $<
	

libxplane.a: $(OBJ)
	ar rcs libxplane.a *.o

clean:
	rm -f libxplane.a
	rm -f *.o
	