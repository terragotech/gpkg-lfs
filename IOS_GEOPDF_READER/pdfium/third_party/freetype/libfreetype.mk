INCLUDE=-DFT2_BUILD_LIBRARY -I./include

libfreetype.a: ./src/cff/cff.c ./src/base/ftbase.c ./src/base/ftbitmap.c ./src/base/ftglyph.c ./src/base/ftinit.c ./src/base/ftlcdfil.c ./src/base/ftmm.c ./src/base/ftsystem.c ./src/psaux/psaux.c ./src/pshinter/pshinter.c ./src/psnames/psmodule.c ./src/raster/raster.c ./src/sfnt/sfnt.c ./src/smooth/smooth.c ./src/truetype/truetype.c ./src/type1/type1.c ./src/cid/type1cid.c
	$(CC) $(INCLUDE) $(CFLAGS)		./src/cff/cff.c	-o	cff.o
	$(CC) $(INCLUDE) $(CFLAGS)		./src/base/ftbase.c	-o	ftbase.o
	$(CC) $(INCLUDE) $(CFLAGS)		./src/base/ftbitmap.c	-o	ftbitmap.o
	$(CC) $(INCLUDE) $(CFLAGS)		./src/base/ftglyph.c	-o	ftglyph.o
	$(CC) $(INCLUDE) $(CFLAGS)		./src/base/ftinit.c	-o	ftinit.o
	$(CC) $(INCLUDE) $(CFLAGS)		./src/base/ftlcdfil.c	-o	ftlcdfil.o
	$(CC) $(INCLUDE) $(CFLAGS)		./src/base/ftmm.c	-o	ftmm.o
	$(CC) $(INCLUDE) $(CFLAGS)		./src/base/ftsystem.c	-o	ftsystem.o
	$(CC) $(INCLUDE) $(CFLAGS)		./src/psaux/psaux.c	-o	psaux.o
	$(CC) $(INCLUDE) $(CFLAGS)		./src/pshinter/pshinter.c	-o	pshinter.o
	$(CC) $(INCLUDE) $(CFLAGS)		./src/psnames/psmodule.c	-o	psmodule.o
	$(CC) $(INCLUDE) $(CFLAGS)		./src/raster/raster.c	-o	raster.o
	$(CC) $(INCLUDE) $(CFLAGS)		./src/sfnt/sfnt.c	-o	sfnt.o
	$(CC) $(INCLUDE) $(CFLAGS)		./src/smooth/smooth.c	-o	smooth.o
	$(CC) $(INCLUDE) $(CFLAGS)		./src/truetype/truetype.c	-o	truetype.o
	$(CC) $(INCLUDE) $(CFLAGS)		./src/type1/type1.c	-o	type1.o
	$(CC) $(INCLUDE) $(CFLAGS)		./src/cid/type1cid.c	-o	type1cid.o

	$(AR) rcs libfreetype.a cff.o ftbase.o ftbitmap.o ftglyph.o ftinit.o ftlcdfil.o ftmm.o ftsystem.o psaux.o pshinter.o psmodule.o raster.o sfnt.o smooth.o truetype.o type1.o type1cid.o
	
clean:
	rm -f *.o
	rm -f *.a