#fx_lcms2
CC=aarch64-linux-android-gcc
CPP=aarch64-linux-android-clang++
AR=aarch64-linux-android-ar
CFLAGS=-c
INCLUDE=-I./include

libfx_lcms2.a: ./src/cmscam02.c ./src/cmscgats.c ./src/cmscnvrt.c ./src/cmserr.c ./src/cmsgamma.c ./src/cmsgmt.c ./src/cmshalf.c ./src/cmsintrp.c ./src/cmsio0.c ./src/cmsio1.c ./src/cmslut.c ./src/cmsmd5.c ./src/cmsmtrx.c ./src/cmsnamed.c ./src/cmsopt.c ./src/cmspack.c ./src/cmspcs.c ./src/cmsplugin.c ./src/cmsps2.c ./src/cmssamp.c ./src/cmssm.c ./src/cmstypes.c ./src/cmsvirt.c ./src/cmswtpnt.c ./src/cmsxform.c
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmscam02.c -o cmscam02.o
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmscgats.c -o cmscgats.o
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmscnvrt.c -o cmscnvrt.o
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmserr.c -o cmserr.o
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmsgamma.c -o cmsgamma.o
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmsgmt.c -o cmsgmt.o
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmshalf.c -o cmshalf.o
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmsintrp.c -o cmsintrp.o
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmsio0.c -o cmsio0.o
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmsio1.c -o cmsio1.o
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmslut.c -o cmslut.o
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmsmd5.c -o cmsmd5.o
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmsmtrx.c -o cmsmtrx.o
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmsnamed.c -o cmsnamed.o
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmsopt.c -o cmsopt.o
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmspack.c -o cmspack.o
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmspcs.c -o cmspcs.o
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmsplugin.c -o cmsplugin.o
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmsps2.c -o cmsps2.o
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmssamp.c -o cmssamp.o
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmssm.c -o cmssm.o
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmstypes.c -o cmstypes.o
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmsvirt.c -o cmsvirt.o
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmswtpnt.c -o cmswtpnt.o
	$(CC) $(INCLUDE) $(CFLAGS) ./src/cmsxform.c -o cmsxform.o
	$(AR) rcs libfx_lcms2.a cmscam02.o cmscgats.o cmscnvrt.o cmserr.o cmsgamma.o cmsgmt.o cmshalf.o cmsintrp.o cmsio0.o cmsio1.o cmslut.o cmsmd5.o cmsmtrx.o cmsnamed.o cmsopt.o cmspack.o cmspcs.o cmsplugin.o cmsps2.o cmssamp.o cmssm.o cmstypes.o cmsvirt.o cmswtpnt.o cmsxform.o

clean:
	rm -f *.o
	rm -f *.a