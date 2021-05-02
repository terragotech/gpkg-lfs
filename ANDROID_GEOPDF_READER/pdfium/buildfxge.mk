 #libfxge
CC=aarch64-linux-android-gcc
CPP=aarch64-linux-android-clang++
AR=aarch64-linux-android-ar
CFLAGS=-c
INCLUDE=-I. -I./agg/include -I./android -I./ge -I./third_party/freetype/include -I./core/include/fxge -I./core/src/fxge/android -I./core/src/fxge/apple/ -I./core/src/fxge/dib -I./core/src/fxge/ge

libfxge.a: ./core/src/fxge/agg/src/fx_agg_driver.cpp ./core/src/fxge/android/fpf_skiafont.cpp ./core/src/fxge/android/fpf_skiafontmgr.cpp ./core/src/fxge/android/fpf_skiafontmgr.h ./core/src/fxge/android/fpf_skiamodule.cpp ./core/src/fxge/android/fx_android_font.cpp ./core/src/fxge/android/fx_android_font.h ./core/src/fxge/android/fx_android_imp.cpp ./core/src/fxge/apple/fx_apple_platform.cpp ./core/src/fxge/apple/fx_mac_imp.cpp ./core/src/fxge/apple/fx_quartz_device.cpp ./core/src/fxge/dib/fx_dib_composite.cpp ./core/src/fxge/dib/fx_dib_convert.cpp ./core/src/fxge/dib/fx_dib_engine.cpp ./core/src/fxge/dib/fx_dib_main.cpp ./core/src/fxge/dib/fx_dib_transform.cpp ./core/src/fxge/fontdata/chromefontdata/FoxitDingbats.c ./core/src/fxge/fontdata/chromefontdata/FoxitFixed.c ./core/src/fxge/fontdata/chromefontdata/FoxitFixedBold.c ./core/src/fxge/fontdata/chromefontdata/FoxitFixedBoldItalic.c ./core/src/fxge/fontdata/chromefontdata/FoxitFixedItalic.c ./core/src/fxge/fontdata/chromefontdata/FoxitSans.c ./core/src/fxge/fontdata/chromefontdata/FoxitSansBold.c ./core/src/fxge/fontdata/chromefontdata/FoxitSansBoldItalic.c ./core/src/fxge/fontdata/chromefontdata/FoxitSansItalic.c ./core/src/fxge/fontdata/chromefontdata/FoxitSansMM.c ./core/src/fxge/fontdata/chromefontdata/FoxitSerif.c ./core/src/fxge/fontdata/chromefontdata/FoxitSerifBold.c ./core/src/fxge/fontdata/chromefontdata/FoxitSerifBoldItalic.c ./core/src/fxge/fontdata/chromefontdata/FoxitSerifItalic.c ./core/src/fxge/fontdata/chromefontdata/FoxitSerifMM.c ./core/src/fxge/fontdata/chromefontdata/FoxitSymbol.c ./core/src/fxge/freetype/fx_freetype.c ./core/src/fxge/ge/fx_ge.cpp ./core/src/fxge/ge/fx_ge_device.cpp ./core/src/fxge/ge/fx_ge_font.cpp ./core/src/fxge/ge/fx_ge_fontmap.cpp ./core/src/fxge/ge/fx_ge_linux.cpp ./core/src/fxge/ge/fx_ge_path.cpp ./core/src/fxge/ge/fx_ge_ps.cpp ./core/src/fxge/ge/fx_ge_text.cpp
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxge/agg/src/fx_agg_driver.cpp	-o	fx_agg_driver.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxge/android/fpf_skiafont.cpp	-o	fpf_skiafont.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxge/android/fpf_skiafontmgr.cpp	-o	fpf_skiafontmgr.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxge/android/fpf_skiamodule.cpp	-o	fpf_skiamodule.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxge/android/fx_android_font.cpp	-o	fx_android_font.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxge/android/fx_android_imp.cpp	-o	fx_android_imp.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxge/apple/fx_apple_platform.cpp	-o	x_apple_platform.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxge/apple/fx_mac_imp.cpp	-o	fx_mac_imp.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxge/apple/fx_quartz_device.cpp	-o	fx_quartz_device.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxge/dib/fx_dib_composite.cpp	-o	fx_dib_composite.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxge/dib/fx_dib_convert.cpp	-o	fx_dib_convert.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxge/dib/fx_dib_engine.cpp	-o	fx_dib_engine.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxge/dib/fx_dib_main.cpp	-o	fx_dib_main.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxge/dib/fx_dib_transform.cpp	-o	fx_dib_transform.o
	$(CC) $(INCLUDE) $(CFLAGS)		./core/src/fxge/fontdata/chromefontdata/FoxitDingbats.c	-o	FoxitDingbats.o
	$(CC) $(INCLUDE) $(CFLAGS)		./core/src/fxge/fontdata/chromefontdata/FoxitFixed.c	-o	FoxitFixed.o
	$(CC) $(INCLUDE) $(CFLAGS)		./core/src/fxge/fontdata/chromefontdata/FoxitFixedBold.c	-o	FoxitFixedBold.o
	$(CC) $(INCLUDE) $(CFLAGS)		./core/src/fxge/fontdata/chromefontdata/FoxitFixedBoldItalic.c	-o	FoxitFixedBoldItalic.o
	$(CC) $(INCLUDE) $(CFLAGS)		./core/src/fxge/fontdata/chromefontdata/FoxitFixedItalic.c	-o	FoxitFixedItalic.o
	$(CC) $(INCLUDE) $(CFLAGS)		./core/src/fxge/fontdata/chromefontdata/FoxitSans.c	-o	FoxitSans.o
	$(CC) $(INCLUDE) $(CFLAGS)		./core/src/fxge/fontdata/chromefontdata/FoxitSansBold.c	-o	FoxitSansBold.o
	$(CC) $(INCLUDE) $(CFLAGS)		./core/src/fxge/fontdata/chromefontdata/FoxitSansBoldItalic.c	-o	FoxitSansBoldItalic.o
	$(CC) $(INCLUDE) $(CFLAGS)		./core/src/fxge/fontdata/chromefontdata/FoxitSansItalic.c	-o	FoxitSansItalic.o
	$(CC) $(INCLUDE) $(CFLAGS)		./core/src/fxge/fontdata/chromefontdata/FoxitSansMM.c	-o	FoxitSansMM.o
	$(CC) $(INCLUDE) $(CFLAGS)		./core/src/fxge/fontdata/chromefontdata/FoxitSerif.c	-o	FoxitSerif.o
	$(CC) $(INCLUDE) $(CFLAGS)		./core/src/fxge/fontdata/chromefontdata/FoxitSerifBold.c	-o	FoxitSerifBold.o
	$(CC) $(INCLUDE) $(CFLAGS)		./core/src/fxge/fontdata/chromefontdata/FoxitSerifBoldItalic.c	-o	FoxitSerifBoldItalic.o
	$(CC) $(INCLUDE) $(CFLAGS)		./core/src/fxge/fontdata/chromefontdata/FoxitSerifItalic.c	-o	FoxitSerifItalic.o
	$(CC) $(INCLUDE) $(CFLAGS)		./core/src/fxge/fontdata/chromefontdata/FoxitSerifMM.c	-o	FoxitSerifMM.o
	$(CC) $(INCLUDE) $(CFLAGS)		./core/src/fxge/fontdata/chromefontdata/FoxitSymbol.c	-o	FoxitSymbol.o
	$(CC) $(INCLUDE) $(CFLAGS)		./core/src/fxge/freetype/fx_freetype.c	-o	fx_freetype.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxge/ge/fx_ge.cpp	-o	fx_ge.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxge/ge/fx_ge_device.cpp	-o	fx_ge_device.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxge/ge/fx_ge_font.cpp	-o	fx_ge_font.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxge/ge/fx_ge_fontmap.cpp	-o	fx_ge_fontmap.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxge/ge/fx_ge_linux.cpp	-o	fx_ge_linux.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxge/ge/fx_ge_path.cpp	-o	fx_ge_path.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxge/ge/fx_ge_ps.cpp	-o	fx_ge_ps.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fxge/ge/fx_ge_text.cpp	-o	fx_ge_text.o
	$(AR) rcs libfxge.a fx_agg_driver.o fpf_skiafont.o fpf_skiafontmgr.o  fpf_skiamodule.o fx_android_font.o  fx_android_imp.o x_apple_platform.o fx_mac_imp.o fx_quartz_device.o fx_dib_composite.o fx_dib_convert.o fx_dib_engine.o fx_dib_main.o fx_dib_transform.o FoxitDingbats.o FoxitFixed.o FoxitFixedBold.o FoxitFixedBoldItalic.o FoxitFixedItalic.o FoxitSans.o FoxitSansBold.o FoxitSansBoldItalic.o FoxitSansItalic.o FoxitSansMM.o FoxitSerif.o FoxitSerifBold.o FoxitSerifBoldItalic.o FoxitSerifItalic.o FoxitSerifMM.o FoxitSymbol.o fx_freetype.o fx_ge.o fx_ge_device.o fx_ge_font.o fx_ge_fontmap.o fx_ge_linux.o fx_ge_path.o fx_ge_ps.o fx_ge_text.o 
	
clean:
	rm -f libfxge.a
	

	
	
	
