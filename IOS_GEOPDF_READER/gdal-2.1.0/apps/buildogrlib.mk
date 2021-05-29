INCLUDE=-I. -I.. -I../port -I../gcore -I../ogr -I../ogr/ogrsf_frmts -I../ogr/ogrsf_frmts/geojson -I../alg
OBJ = ogr2ogr_bin.o

EXTRAFLAGS = 
%.o: %.cpp
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) -o $@ $<
	

libogrlib.a: $(OBJ)
	ar rcs libogrlib.a *.o

clean:
	rm -f libogrlib.a
	rm -f *.o
	