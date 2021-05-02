#libfxcrt
CC=aarch64-linux-android-gcc
CPP=aarch64-linux-android-clang++
AR=aarch64-linux-android-ar
CFLAGS=-c
INCLUDE=-I./core/include/fxcrt -I./core/src/fxcrt

libfxcrt.a: ./core/src/fxcrt/fxcrt_platforms.cpp ./core/src/fxcrt/fxcrt_posix.cpp ./core/src/fxcrt/fxcrt_windows.cpp ./core/src/fxcrt/fx_arabic.cpp ./core/src/fxcrt/fx_basic_array.cpp ./core/src/fxcrt/fx_basic_bstring.cpp ./core/src/fxcrt/fx_basic_buffer.cpp ./core/src/fxcrt/fx_basic_coords.cpp ./core/src/fxcrt/fx_basic_gcc.cpp ./core/src/fxcrt/fx_basic_list.cpp ./core/src/fxcrt/fx_basic_maps.cpp ./core/src/fxcrt/fx_basic_memmgr.cpp ./core/src/fxcrt/fx_basic_plex.cpp ./core/src/fxcrt/fx_basic_utf.cpp ./core/src/fxcrt/fx_basic_util.cpp ./core/src/fxcrt/fx_basic_wstring.cpp ./core/src/fxcrt/fx_extension.cpp ./core/src/fxcrt/fx_ucddata.cpp ./core/src/fxcrt/fx_unicode.cpp ./core/src/fxcrt/fx_xml_composer.cpp ./core/src/fxcrt/fx_xml_parser.cpp
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxcrt/fxcrt_platforms.cpp	-o	fxcrt_platforms.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxcrt/fxcrt_posix.cpp	-o	fxcrt_posix.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxcrt/fxcrt_windows.cpp	-o	fxcrt_windows.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxcrt/fx_arabic.cpp	-o	fx_arabic.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxcrt/fx_basic_array.cpp	-o	fx_basic_array.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxcrt/fx_basic_bstring.cpp	-o	fx_basic_bstring.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxcrt/fx_basic_buffer.cpp	-o	fx_basic_buffer.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxcrt/fx_basic_coords.cpp	-o	fx_basic_coords.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxcrt/fx_basic_gcc.cpp	-o	fx_basic_gcc.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxcrt/fx_basic_list.cpp	-o	fx_basic_list.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxcrt/fx_basic_maps.cpp	-o	fx_basic_maps.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxcrt/fx_basic_memmgr.cpp	-o	fx_basic_memmgr.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxcrt/fx_basic_plex.cpp	-o	fx_basic_plex.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxcrt/fx_basic_utf.cpp	-o	fx_basic_utf.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxcrt/fx_basic_util.cpp	-o	fx_basic_util.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxcrt/fx_basic_wstring.cpp	-o	fx_basic_wstring.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxcrt/fx_extension.cpp	-o	fx_extension.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxcrt/fx_ucddata.cpp	-o	fx_ucddata.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxcrt/fx_unicode.cpp	-o	fx_unicode.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxcrt/fx_xml_composer.cpp	-o	fx_xml_composer.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxcrt/fx_xml_parser.cpp	-o	fx_xml_parser.o
	$(AR) rcs libfxcrt.a fxcrt_platforms.o fxcrt_posix.o fxcrt_windows.o fx_arabic.o fx_basic_array.o fx_basic_bstring.o fx_basic_buffer.o fx_basic_coords.o fx_basic_gcc.o    fx_basic_list.o fx_basic_maps.o fx_basic_memmgr.o fx_basic_plex.o fx_basic_utf.o fx_basic_util.o fx_basic_wstring.o fx_extension.o fx_ucddata.o fx_unicode.o fx_xml_composer.o fx_xml_parser.o

clean:
	rm -f libfxcrt.a
