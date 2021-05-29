INCLUDE=-I. -I.. -I../../port -I../../alg -I.. -I../../ogr/ogrsf_frmts -I../../ogr -I../../gnm
OBJ = reader_digital_globe.o reader_geo_eye.o reader_orb_view.o \
                reader_pleiades.o reader_rdk1.o reader_landsat.o \
                reader_spot.o reader_rapid_eye.o reader_alos.o reader_eros.o \
                reader_kompsat.o

EXTRAFLAGS = 
	
%.o: %.cpp
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) -o $@ $<
	

libmdreader.a: $(OBJ)
	ar rcs libmdreader.a *.o

clean:
	rm -f libmdreader.a
	rm -f *.o
	