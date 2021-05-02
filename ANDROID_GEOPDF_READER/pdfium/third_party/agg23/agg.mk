 #agg
CC=aarch64-linux-android-gcc
CPP=aarch64-linux-android-clang++
AR=aarch64-linux-android-ar
CFLAGS=-c
INCLUDE=-I.


libfx_agg.a: agg_curves.cpp agg_path_storage.cpp agg_rasterizer_scanline_aa.cpp agg_vcgen_dash.cpp agg_vcgen_stroke.cpp
	$(CPP) $(INCLUDE) $(CFLAGS) agg_curves.cpp -o agg_curves.o
	$(CPP) $(INCLUDE) $(CFLAGS) agg_path_storage.cpp -o agg_path_storage.o
	$(CPP) $(INCLUDE) $(CFLAGS) agg_rasterizer_scanline_aa.cpp -o agg_rasterizer_scanline_aa.o
	$(CPP) $(INCLUDE) $(CFLAGS) agg_vcgen_dash.cpp -o agg_vcgen_dash.o
	$(CPP) $(INCLUDE) $(CFLAGS) agg_vcgen_stroke.cpp -o agg_vcgen_stroke.o
	$(AR) rcs libfx_agg.a agg_curves.o agg_path_storage.o agg_rasterizer_scanline_aa.o agg_vcgen_dash.o agg_vcgen_stroke.o
clean:
	rm -f *.o
	rm -f libfx_agg.a
