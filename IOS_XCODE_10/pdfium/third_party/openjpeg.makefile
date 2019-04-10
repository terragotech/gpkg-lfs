DEFS_Release := '-DOPJ_STATIC' '-D_CRT_SECURE_NO_WARNINGS' '-DV8_DEPRECATION_WARNINGS' '-DFT2_BUILD_LIBRARY'
CFLAGS_Release := -Wall -W -Wno-missing-field-initializers -Wno-sign-compare -Wno-unused-parameter -pthread -fno-exceptions -fPIC -fno-strict-aliasing -fdata-sections -ffunction-sections -O3 -O2
CUS_LIB := -lstdc++
CUS_CFLAGS := $(DEFS_Release) $(CFLAGS_Release) $(CFLAGS_Release)
CUS_CXXFLAGS := $(DEFS_Release) $(CFLAGS_Release) $(CFLAGS_CC_Release)
CUS_INCLUDES := -I./libjpeg
CUS_LIB := -lstdc++
libfx_libopenjpeg.a:
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libopenjpeg20/bio.c -o ./libopenjpeg20/bio.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libopenjpeg20/cio.c -o ./libopenjpeg20/cio.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libopenjpeg20/dwt.c -o ./libopenjpeg20/dwt.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libopenjpeg20/event.c -o ./libopenjpeg20/event.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libopenjpeg20/function_list.c -o ./libopenjpeg20/function_list.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libopenjpeg20/image.c -o ./libopenjpeg20/image.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libopenjpeg20/invert.c -o ./libopenjpeg20/invert.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libopenjpeg20/j2k.c -o ./libopenjpeg20/j2k.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libopenjpeg20/jp2.c -o ./libopenjpeg20/jp2.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libopenjpeg20/mct.c -o ./libopenjpeg20/mct.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libopenjpeg20/mqc.c -o ./libopenjpeg20/mqc.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libopenjpeg20/openjpeg.c -o ./libopenjpeg20/openjpeg.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libopenjpeg20/opj_clock.c -o ./libopenjpeg20/opj_clock.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libopenjpeg20/pi.c -o ./libopenjpeg20/pi.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libopenjpeg20/raw.c -o ./libopenjpeg20/raw.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libopenjpeg20/t1.c -o ./libopenjpeg20/t1.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libopenjpeg20/t2.c -o ./libopenjpeg20/t2.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libopenjpeg20/tcd.c -o ./libopenjpeg20/tcd.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libopenjpeg20/tgt.c -o ./libopenjpeg20/tgt.o

	ar rcs ./libopenjpeg20/libfx_libopenjpeg.a ./libopenjpeg20/*.o
	rm ./libopenjpeg20/*.o

clean:
	rm ./libopenjpeg20/libfx_libopenjpeg.a