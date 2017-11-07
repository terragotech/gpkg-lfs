DEFS_Release := '-DOPJ_STATIC' '-D_CRT_SECURE_NO_WARNINGS' '-DV8_DEPRECATION_WARNINGS' '-DFT2_BUILD_LIBRARY'
CFLAGS_Release := -Wall -W -Wno-missing-field-initializers -Wno-sign-compare -Wno-unused-parameter -pthread -fno-exceptions -fPIC -fno-strict-aliasing -fdata-sections -ffunction-sections -O3 -O2
CFLAGS_CC_Release := -std=c++0x -Wnon-virtual-dtor -fno-rtti
CUS_CFLAGS := $(DEFS_Release) $(CFLAGS_Release) $(CFLAGS_Release)
CUS_CXXFLAGS := $(DEFS_Release) $(CFLAGS_Release) $(CFLAGS_CC_Release)
CUS_INCLUDES := -I./freetype -I./freetype/include
CUS_LIB := -lstdc++
libfreetype.a:
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./freetype/src/cff/cff.c -o ./freetype/src/cff/cff.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./freetype/src/base/ftbase.c -o ./freetype/src/base/ftbase.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./freetype/src/base/ftbitmap.c -o ./freetype/src/base/ftbitmap.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./freetype/src/base/ftglyph.c -o ./freetype/src/base/ftglyph.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./freetype/src/base/ftinit.c -o ./freetype/src/base/ftinit.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./freetype/src/base/ftlcdfil.c -o ./freetype/src/base/ftlcdfil.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./freetype/src/base/ftmm.c -o ./freetype/src/base/ftmm.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./freetype/src/base/ftsystem.c -o ./freetype/src/base/ftsystem.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./freetype/src/psaux/psaux.c -o ./freetype/src/psaux/psaux.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./freetype/src/pshinter/pshinter.c -o ./freetype/src/pshinter/pshinter.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./freetype/src/psnames/psmodule.c -o ./freetype/src/psnames/psmodule.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./freetype/src/raster/raster.c -o ./freetype/src/raster/raster.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./freetype/src/sfnt/sfnt.c -o ./freetype/src/sfnt/sfnt.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./freetype/src/smooth/smooth.c -o ./freetype/src/smooth/smooth.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./freetype/src/truetype/truetype.c -o ./freetype/src/truetype/truetype.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./freetype/src/type1/type1.c -o ./freetype/src/type1/type1.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)  $(CUS_INCLUDES) $(CUS_LIB) -c ./freetype/src/cid/type1cid.c -o ./freetype/src/cid/type1cid.o
	ar rcs ./freetype/libfreetype.a ./freetype/src/cid/*.o ./freetype/src/type1/*.o ./freetype/src/truetype/*.o ./freetype/src/smooth/*.o ./freetype/src/sfnt/*.o ./freetype/src/raster/*.o ./freetype/src/psnames/*.o  ./freetype/src/pshinter/*.o ./freetype/src/psaux/*.o ./freetype/src/base/*.o ./freetype/src/cff/*.o
	rm ./freetype/src/cid/*.o ./freetype/src/type1/*.o ./freetype/src/truetype/*.o ./freetype/src/smooth/*.o ./freetype/src/sfnt/*.o ./freetype/src/raster/*.o ./freetype/src/psnames/*.o  ./freetype/src/pshinter/*.o ./freetype/src/psaux/*.o ./freetype/src/base/*.o ./freetype/src/cff/*.o

clean:
	rm ./freetype/libfreetype.a

