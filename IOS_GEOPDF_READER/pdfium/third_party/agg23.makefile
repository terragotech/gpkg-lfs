CFLAGS_Release := -Wall -W -Wno-missing-field-initializers -Wno-sign-compare -Wno-unused-parameter -pthread -fno-exceptions -fPIC -Wno-extra -fno-strict-aliasing -fdata-sections -ffunction-sections -O3 -O2
CFLAGS_CC_Release := -std=c++0x -Wnon-virtual-dtor -fno-rtti
DEFS_Release_x64 := '-DOPJ_STATIC' '-D_CRT_SECURE_NO_WARNINGS' '-DV8_DEPRECATION_WARNINGS'
CFLAGS_Release_x64 := -Wall -W -Wno-missing-field-initializers -Wno-sign-compare -Wno-unused-parameter -pthread -fno-exceptions -fPIC -Wno-extra -fno-strict-aliasing -fdata-sections -ffunction-sections -O3 -O2
CUS_CFLAGS := $(DEFS_Release) $(CFLAGS_Release) $(CFLAGS_Release)
CUS_CXXFLAGS := $(DEFS_Release_x64) $(CFLAGS_Release) $(CFLAGS_CC_Release)
CUS_INCLUDES := -I./agg23
CUS_LIB := -lstdc++
libfx_agg.a:
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./agg23/agg_curves.cpp -o ./agg23/agg_curves.o 
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./agg23/agg_path_storage.cpp -o ./agg23/agg_path_storage.o 
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./agg23/agg_rasterizer_scanline_aa.cpp -o ./agg23/agg_rasterizer_scanline_aa.o 
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./agg23/agg_vcgen_dash.cpp -o ./agg23/agg_vcgen_dash.o 
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./agg23/agg_vcgen_stroke.cpp -o ./agg23/agg_vcgen_stroke.o 
	ar rcs ./agg23/libfx_agg.a ./agg23/*.o
	rm ./agg23/*.o

clean:
	rm ./agg23/libfx_agg.a
