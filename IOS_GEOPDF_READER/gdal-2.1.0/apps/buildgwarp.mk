INCLUDE=-I. -I.. -I../port -I../gcore -I../ogr -I../ogr/ogrsf_frmts -I../ogr/ogrsf_frmts/geojson -I../alg
OBJ = gdalwarp_lib.o

EXTRAFLAGS = 
%.o: %.cpp
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) -o $@ $<
	

libgwarp.a: $(OBJ)
	ar rcs libgwarp.a *.o

clean:
	rm -f libgwarp.a
	rm -f *.o
	