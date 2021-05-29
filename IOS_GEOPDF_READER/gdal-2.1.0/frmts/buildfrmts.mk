INCLUDE = -I .-I.. -I../port -I../gcore  -I../ogr -I../ogr/ogrsf_frmts -I../ogr -I../apps -I../gnm
OBJ = gdalallregister.o

EXTRAFLAGS = -DFRMT_vrt=1 -DFRMT_gtiff=1 -DFRMT_hfa=1 -DFRMT_png=1 -DFRMT_jpeg=1 -DFRMT_mem=1 -DFRMT_pdf=1

%.o: ./%.cpp
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) -o $@ $<
	

libfrmts.a: $(OBJ)
	ar rcs libfrmts.a *.o

clean:
	rm -f libfrmts.a
	rm -f *.o
	