INCLUDE = -I. -I../../../port -I../../../app -I../../../gcore -I../../../alg -I../../../ogr  -I../../../ogr/ogrsf_frmts 
OBJ = xtiff.o \
	geo_free.o \
	geo_get.o \
	geo_names.o \
	geo_new.o \
	geo_print.o \
	geo_set.o \
	geo_tiffp.o \
	geo_write.o \
	geo_normalize.o \
	geotiff_proj4.o \
	geo_extra.o \
	geo_trans.o \
	geo_simpletags.o
EXTRAFLAGS = -DDONT_DEPRECATE_SPRINTF -DRENAME_INTERNAL_LIBTIFF_SYMBOLS -I../libtiff

%.o: %.c
	$(CC) $(INCLUDE) $(EXTRAFLAGS) $(CFLAGS) -o $@ $<

libgeotiff.a: $(OBJ)
	ar rcs libgeotiff.a *.o

clean:
	rm -f libgeotiff.a
	rm -f *.o
	