INCLUDE = -I .-I.. -I../port -I../gcore  -I../ogr -I../ogr/ogrsf_frmts -I../ogr -I../apps -I../gnm
OBJ = gdalmediancut.o gdaldither.o  gdaltransformer.o \
		gdalsimplewarp.o gdalwarper.o gdalwarpkernel.o \
		gdalwarpoperation.o gdalchecksum.o gdal_rpc.o gdal_tps.o \
		thinplatespline.o llrasterize.o gdalrasterize.o gdalgeoloc.o \
		gdalgrid.o gdalcutline.o gdalproximity.o rasterfill.o \
		gdalrasterpolygonenumerator.o \
		gdalsievefilter.o gdalwarpkernel_opencl.o polygonize.o \
		contour.o gdaltransformgeolocs.o \
		gdal_octave.o gdal_simplesurf.o gdalmatching.o  \
		gdalpansharpen.o

EXTRAFLAGS = 

%.o: ./%.cpp
	$(CC) $(INCLUDE) $(EXTRAFLAGS) $(CFLAGS) -o $@ $<
	

libalg.a: $(OBJ)
	$(CC) $(INCLUDE) $(EXTRAFLAGS) $(CFLAGS) gdal_crs.c -o gdal_crs.o
	$(CC) $(INCLUDE) $(EXTRAFLAGS) $(CFLAGS) delaunay.c -o delaunay.o
	ar rcs libalg.a *.o

clean:
	rm -f libalg.a
	rm -f *.o
	