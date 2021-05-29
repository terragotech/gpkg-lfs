INCLUDE = -I. -I../../port -I../../app -I../../gcore -I../../alg -I../../ogr  -I../../ogr/ogrsf_frmts 
OBJ = geotiff.o gt_wkt_srs.o gt_citation.o  gt_overview.o  tifvsi.o gt_jpeg_copy.o
EXTRAFLAGS = -DINTERNAL_LIBTIFF -Ilibtiff -DINTERNAL_LIBGEOTIFF -Ilibgeotiff -I../jpeg/libjpeg  -DBIGTIFF_SUPPORT -DDONT_DEPRECATE_SPRINTF -DRENAME_INTERNAL_LIBTIFF_SYMBOLS
%.o: %.cpp
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) -o $@ $<

libgtiff.a: $(OBJ)
	$(CC) $(INCLUDE) $(EXTRAFLAGS) $(CFLAGS) -o tif_float.o tif_float.c
	ar rcs libgtiff.a *.o

clean:
	rm -f libgtiff.a
	rm -f *.o
	