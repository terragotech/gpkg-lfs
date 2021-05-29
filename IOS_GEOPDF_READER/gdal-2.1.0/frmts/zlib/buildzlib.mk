INCLUDE=-I. 
OBJ = adler32.o \
	compress.o \
	crc32.o \
	deflate.o \
	gzio.o \
	infback.o \
	inffast.o \
	inflate.o \
	inftrees.o \
	trees.o \
	uncompr.o \
	zutil.o

EXTRAFLAGS = -DDONT_DEPRECATE_SPRINTF
	
%.o: %.cpp
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) -o $@ $<
	

libzlib.a: $(OBJ)
	ar rcs libzlib.a *.o

clean:
	rm -f libzlib.a
	rm -f *.o
	