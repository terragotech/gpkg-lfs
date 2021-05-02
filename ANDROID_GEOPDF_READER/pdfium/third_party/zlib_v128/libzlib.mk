#fx_lcms2
CC=aarch64-linux-android-gcc
CPP=aarch64-linux-android-clang++
AR=aarch64-linux-android-ar
CFLAGS=-c
INCLUDE=-I.

libfx_zlib.a: adler32.c compress.c crc32.c deflate.c gzclose.c gzlib.c gzread.c gzwrite.c infback.c inffast.c inflate.c inftrees.c trees.c uncompr.c zutil.c
	$(CC) $(INCLUDE) $(CFLAGS)	adler32.c	-o	adler32.o
	$(CC) $(INCLUDE) $(CFLAGS)	compress.c	-o	compress.o
	$(CC) $(INCLUDE) $(CFLAGS)	crc32.c	-o	crc32.o
	$(CC) $(INCLUDE) $(CFLAGS)	deflate.c	-o	deflate.o
	$(CC) $(INCLUDE) $(CFLAGS)	gzclose.c	-o	gzclose.o
	$(CC) $(INCLUDE) $(CFLAGS)	gzlib.c	-o	gzlib.o
	$(CC) $(INCLUDE) $(CFLAGS)	gzread.c	-o	gzread.o
	$(CC) $(INCLUDE) $(CFLAGS)	gzwrite.c	-o	gzwrite.o
	$(CC) $(INCLUDE) $(CFLAGS)	infback.c	-o	infback.o
	$(CC) $(INCLUDE) $(CFLAGS)	inffast.c	-o	inffast.o
	$(CC) $(INCLUDE) $(CFLAGS)	inflate.c	-o	inflate.o
	$(CC) $(INCLUDE) $(CFLAGS)	inftrees.c	-o	inftrees.o
	$(CC) $(INCLUDE) $(CFLAGS)	trees.c	-o	trees.o
	$(CC) $(INCLUDE) $(CFLAGS)	uncompr.c	-o	uncompr.o
	$(CC) $(INCLUDE) $(CFLAGS)	zutil.c	-o	zutil.o

	$(AR) rcs libfx_zlib.a adler32.o compress.o crc32.o deflate.o gzclose.o gzlib.o gzread.o gzwrite.o infback.o inffast.o inflate.o inftrees.o trees.o uncompr.o zutil.o
	
clean:
	rm -f *.o
	rm -f *.a