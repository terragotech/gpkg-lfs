INCLUDE = -I. -I../../../port -I../../../app -I../../../gcore -I../../../alg -I../../../ogr  -I../../../ogr/ogrsf_frmts 
OBJ = tif_aux.o \
	tif_close.o \
	tif_codec.o \
	tif_color.o \
	tif_compress.o \
	tif_dir.o \
	tif_dirinfo.o \
	tif_dirread.o \
	tif_dirwrite.o \
	tif_dumpmode.o \
	tif_error.o \
	tif_extension.o \
	tif_fax3.o \
	tif_fax3sm.o \
	tif_getimage.o \
	tif_jpeg.o \
	tif_jpeg_12.o \
	tif_flush.o \
	tif_luv.o \
	tif_lzw.o \
	tif_next.o \
	tif_ojpeg.o \
	tif_open.o \
	tif_packbits.o \
	tif_pixarlog.o \
	tif_predict.o \
	tif_print.o \
	tif_read.o \
	tif_swab.o \
	tif_strip.o \
	tif_thunder.o \
	tif_tile.o \
	tif_vsi.o \
	tif_version.o \
	tif_warning.o \
	tif_write.o \
	tif_zip.o \
	tif_lzma.o
EXTRAFLAGS = -DDONT_DEPRECATE_SPRINTF -DRENAME_INTERNAL_LIBTIFF_SYMBOLS -I../../zlib -I../../jpeg/libjpeg

%.o: %.c
	$(CC) $(INCLUDE) $(EXTRAFLAGS) $(CFLAGS) -o $@ $<

libtiff.a: $(OBJ)
	ar rcs libtiff.a *.o

clean:
	rm -f libtiff.a
	rm -f *.o
	