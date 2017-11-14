CFLAGS_CC_Release := -std=c++0x -Wnon-virtual-dtor -fno-rtti
INCS_Release := -Ithird_party/freetype/include
CFLAGS_Release := -Wall -W -Wno-missing-field-initializers -Wno-sign-compare -Wno-unused-parameter -pthread -fno-exceptions -fPIC -fno-strict-aliasing -fdata-sections -ffunction-sections -O3 -O2
DEFS_Release := '-DOPJ_STATIC' '-DV8_DEPRECATION_WARNINGS' '-D_CRT_SECURE_NO_WARNINGS -D_FXM_PLATFORM_APPLE_'

CUS_CFLAGS := $(DEFS_Release) $(CFLAGS_Release) 
CUS_CXXFLAGS := $(DEFS_Release) $(CFLAGS_Release) $(CFLAGS_CC_Release)
CUS_INCLUDES := -I./bigint $(INCS_Release) 
CUS_LIB := -lstdc++

libfx_crt.a:
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./core/src/fxcrt/fxcrt_platforms.cpp -o ./core/src/fxcrt/fxcrt_platforms.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./core/src/fxcrt/fxcrt_posix.cpp -o ./core/src/fxcrt/fxcrt_posix.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./core/src/fxcrt/fxcrt_windows.cpp -o ./core/src/fxcrt/fxcrt_windows.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./core/src/fxcrt/fx_arabic.cpp -o ./core/src/fxcrt/fx_arabic.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./core/src/fxcrt/fx_basic_array.cpp -o ./core/src/fxcrt/fx_basic_array.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./core/src/fxcrt/fx_basic_bstring.cpp -o ./core/src/fxcrt/fx_basic_bstring.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./core/src/fxcrt/fx_basic_buffer.cpp -o ./core/src/fxcrt/fx_basic_buffer.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./core/src/fxcrt/fx_basic_coords.cpp -o ./core/src/fxcrt/fx_basic_coords.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./core/src/fxcrt/fx_basic_gcc.cpp -o ./core/src/fxcrt/fx_basic_gcc.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./core/src/fxcrt/fx_basic_list.cpp -o ./core/src/fxcrt/fx_basic_list.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./core/src/fxcrt/fx_basic_maps.cpp -o ./core/src/fxcrt/fx_basic_maps.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./core/src/fxcrt/fx_basic_memmgr.cpp -o ./core/src/fxcrt/fx_basic_memmgr.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./core/src/fxcrt/fx_basic_plex.cpp -o ./core/src/fxcrt/fx_basic_plex.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./core/src/fxcrt/fx_basic_utf.cpp -o ./core/src/fxcrt/fx_basic_utf.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./core/src/fxcrt/fx_basic_util.cpp -o ./core/src/fxcrt/fx_basic_util.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./core/src/fxcrt/fx_basic_wstring.cpp -o ./core/src/fxcrt/fx_basic_wstring.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./core/src/fxcrt/fx_extension.cpp -o ./core/src/fxcrt/fx_extension.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./core/src/fxcrt/fx_ucddata.cpp -o ./core/src/fxcrt/fx_ucddata.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./core/src/fxcrt/fx_unicode.cpp -o ./core/src/fxcrt/fx_unicode.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./core/src/fxcrt/fx_xml_composer.cpp -o ./core/src/fxcrt/fx_xml_composer.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./core/src/fxcrt/fx_xml_parser.cpp -o ./core/src/fxcrt/fx_xml_parser.o
	ar rcs ./core/src/fxcrt/libfx_crt.a ./core/src/fxcrt/*.o
	rm ./core/src/fxcrt/*.o

clean:
	rm ./core/src/fxcrt/libfx_crt.a