CFLAGS_CC_Release := -std=c++0x -Wnon-virtual-dtor -fno-rtti
DEFS_Release := '-DOPJ_STATIC' '-D_CRT_SECURE_NO_WARNINGS' '-DV8_DEPRECATION_WARNINGS' 
CFLAGS_Release := -Wall -W -Wno-missing-field-initializers -Wno-sign-compare -Wno-unused-parameter -pthread -fno-exceptions -fPIC -Wno-main -Wno-missing-braces -Wno-unused -fno-strict-aliasing -fdata-sections -ffunction-sections -O3 -O2

CUS_CFLAGS := $(DEFS_Release) $(CFLAGS_Release)
CUS_CXXFLAGS := $(DEFS_Release) $(CFLAGS_Release) $(CFLAGS_CC_Release)
CUS_INCLUDES := -I./lcms2-2.6
CUS_LIB := -lstdc++

libfx_lcms2.a:
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmscam02.c -o ./lcms2-2.6/src/cmscam02.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmscgats.c -o ./lcms2-2.6/src/cmscgats.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmscnvrt.c -o ./lcms2-2.6/src/cmscnvrt.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmserr.c -o ./lcms2-2.6/src/cmserr.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmsgamma.c -o ./lcms2-2.6/src/cmsgamma.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmsgmt.c -o ./lcms2-2.6/src/cmsgmt.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmshalf.c -o ./lcms2-2.6/src/cmshalf.o 
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmsintrp.c -o ./lcms2-2.6/src/cmsintrp.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmsio0.c -o ./lcms2-2.6/src/cmsio0.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmsio1.c -o ./lcms2-2.6/src/cmsio1.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmslut.c -o ./lcms2-2.6/src/cmslut.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmsmd5.c -o ./lcms2-2.6/src/cmsmd5.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmsmtrx.c -o ./lcms2-2.6/src/cmsmtrx.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmsnamed.c -o ./lcms2-2.6/src/cmsnamed.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmsopt.c -o ./lcms2-2.6/src/cmsopt.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmspack.c -o ./lcms2-2.6/src/cmspack.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmspcs.c -o ./lcms2-2.6/src/cmspcs.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmsplugin.c -o ./lcms2-2.6/src/cmsplugin.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmsps2.c -o ./lcms2-2.6/src/cmsps2.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmssamp.c -o ./lcms2-2.6/src/cmssamp.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmssm.c -o ./lcms2-2.6/src/cmssm.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmstypes.c -o ./lcms2-2.6/src/cmstypes.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmsvirt.c -o ./lcms2-2.6/src/cmsvirt.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmswtpnt.c -o ./lcms2-2.6/src/cmswtpnt.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS)   $(CUS_INCLUDES) $(CUS_LIB) -c ./lcms2-2.6/src/cmsxform.c -o ./lcms2-2.6/src/cmsxform.o
	ar rcs ./lcms2-2.6/libfx_lcms2.a ./lcms2-2.6/src/*.o
	rm ./lcms2-2.6/src/*.o

clean:
	rm ./lcms2-2.6/libfx_lcms2.a

