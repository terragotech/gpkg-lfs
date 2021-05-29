INCLUDE = -I. -I../vrt -I../mem -I../../ogr/ogrsf_frmts/mem -I. -I../../port -I../../app -I../../gcore -I../../alg -I../../ogr  -I../../ogr/ogrsf_frmts -I./libpng
OBJ = png.o \
	pngerror.o \
	pnggccrd.o \
	pngget.o \
	pngmem.o \
	pngpread.o \
	pngread.o \
	pngrio.o \
	pngrtran.o \
	pngrutil.o \
	pngset.o \
	pngtrans.o \
	pngvcrd.o \
	pngwio.o \
	pngwrite.o \
	pngwtran.o \
	pngwutil.o 

EXTRAFLAGS = -DHAVE_PDFIUM 

%.o: ./libpng/%.c
	$(CC) $(INCLUDE) $(EXTRAFLAGS) $(CFLAGS) -o $@ $<
	

libpng.a: $(OBJ)
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) pngdataset.cpp -o pngdataset.o
	ar rcs libpng.a *.o

clean:
	rm -f libpng.a
	rm -f *.o
	