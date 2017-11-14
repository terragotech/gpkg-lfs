CFLAGS_Release := -Wall -W -Wno-missing-field-initializers -Wno-sign-compare -Wno-unused-parameter -pthread -fno-exceptions -fPIC -fno-strict-aliasing -fdata-sections -ffunction-sections \
	-O3 -O2
CFLAGS_CC_Release := -std=c++0x -Wnon-virtual-dtor -fno-rtti
DEFS_Release := '-DOPJ_STATIC' '-D_CRT_SECURE_NO_WARNINGS' '-DV8_DEPRECATION_WARNINGS'

CUS_CFLAGS := $(DEFS_Release) $(CFLAGS_Release) $(CFLAGS_Release)
CUS_CXXFLAGS := $(DEFS_Release) $(CFLAGS_Release) $(CFLAGS_CC_Release)
CUS_INCLUDES := -I./zlib_v128
CUS_LIB := -lstdc++

libfx_zlib.a:
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./zlib_v128/adler32.c -o ./zlib_v128/adler32.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./zlib_v128/compress.c -o ./zlib_v128/compress.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./zlib_v128/crc32.c -o ./zlib_v128/crc32.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./zlib_v128/deflate.c -o ./zlib_v128/deflate.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./zlib_v128/gzclose.c -o ./zlib_v128/gzclose.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./zlib_v128/gzlib.c  -o ./zlib_v128/gzlib.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./zlib_v128/gzread.c -o ./zlib_v128/gzread.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./zlib_v128/gzwrite.c -o ./zlib_v128/gzwrite.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./zlib_v128/infback.c -o ./zlib_v128/infback.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./zlib_v128/inffast.c -o ./zlib_v128/inffast.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./zlib_v128/inflate.c -o ./zlib_v128/inflate.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./zlib_v128/inftrees.c -o ./zlib_v128/inftrees.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./zlib_v128/trees.c -o ./zlib_v128/trees.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./zlib_v128/uncompr.c  -o ./zlib_v128/uncompr.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./zlib_v128/zutil.c -o ./zlib_v128/zutil.o
	ar rcs ./zlib_v128/libfx_zlib.a ./zlib_v128/*.o
	rm ./zlib_v128/*.o

clean:
	rm ./zlib_v128/libfx_zlib.a