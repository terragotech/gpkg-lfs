INCLUDE=-I.

libfx_libjpeg.a: fpdfapi_jcapimin.c fpdfapi_jcapistd.c fpdfapi_jccoefct.c fpdfapi_jccolor.c fpdfapi_jcdctmgr.c fpdfapi_jchuff.c fpdfapi_jcinit.c fpdfapi_jcmainct.c fpdfapi_jcmarker.c fpdfapi_jcmaster.c fpdfapi_jcomapi.c fpdfapi_jcparam.c fpdfapi_jcphuff.c fpdfapi_jcprepct.c fpdfapi_jcsample.c fpdfapi_jctrans.c fpdfapi_jdapimin.c fpdfapi_jdapistd.c fpdfapi_jdcoefct.c fpdfapi_jdcolor.c fpdfapi_jddctmgr.c fpdfapi_jdhuff.c fpdfapi_jdinput.c fpdfapi_jdmainct.c fpdfapi_jdmarker.c fpdfapi_jdmaster.c fpdfapi_jdmerge.c fpdfapi_jdphuff.c fpdfapi_jdpostct.c fpdfapi_jdsample.c fpdfapi_jdtrans.c fpdfapi_jerror.c fpdfapi_jfdctfst.c fpdfapi_jfdctint.c fpdfapi_jidctfst.c fpdfapi_jidctint.c fpdfapi_jidctred.c fpdfapi_jmemmgr.c fpdfapi_jmemnobs.c fpdfapi_jutils.c
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jcapimin.c 	-o	fpdfapi_jcapimin.o 
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jcapistd.c	-o	fpdfapi_jcapistd.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jccoefct.c	-o	fpdfapi_jccoefct.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jccolor.c	-o	fpdfapi_jccolor.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jcdctmgr.c	-o	fpdfapi_jcdctmgr.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jchuff.c	-o	fpdfapi_jchuff.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jcinit.c	-o	fpdfapi_jcinit.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jcmainct.c	-o	fpdfapi_jcmainct.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jcmarker.c	-o	fpdfapi_jcmarker.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jcmaster.c	-o	fpdfapi_jcmaster.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jcomapi.c	-o	fpdfapi_jcomapi.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jcparam.c	-o	fpdfapi_jcparam.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jcphuff.c	-o	fpdfapi_jcphuff.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jcprepct.c	-o	fpdfapi_jcprepct.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jcsample.c	-o	fpdfapi_jcsample.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jctrans.c	-o	fpdfapi_jctrans.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jdapimin.c	-o	fpdfapi_jdapimin.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jdapistd.c	-o	fpdfapi_jdapistd.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jdcoefct.c	-o	fpdfapi_jdcoefct.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jdcolor.c	-o	fpdfapi_jdcolor.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jddctmgr.c	-o	fpdfapi_jddctmgr.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jdhuff.c	-o	fpdfapi_jdhuff.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jdinput.c	-o	fpdfapi_jdinput.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jdmainct.c	-o	fpdfapi_jdmainct.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jdmarker.c	-o	fpdfapi_jdmarker.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jdmaster.c	-o	fpdfapi_jdmaster.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jdmerge.c	-o	fpdfapi_jdmerge.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jdphuff.c	-o	fpdfapi_jdphuff.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jdpostct.c	-o	fpdfapi_jdpostct.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jdsample.c	-o	fpdfapi_jdsample.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jdtrans.c	-o	fpdfapi_jdtrans.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jerror.c	-o	fpdfapi_jerror.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jfdctfst.c	-o	fpdfapi_jfdctfst.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jfdctint.c	-o	fpdfapi_jfdctint.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jidctfst.c	-o	fpdfapi_jidctfst.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jidctint.c	-o	fpdfapi_jidctint.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jidctred.c	-o	fpdfapi_jidctred.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jmemmgr.c	-o	fpdfapi_jmemmgr.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jmemnobs.c	-o	fpdfapi_jmemnobs.o
	$(CC) $(INCLUDE) $(CFLAGS)	fpdfapi_jutils.c	-o	fpdfapi_jutils.o
	$(AR) rcs libfx_libjpeg.a fpdfapi_jcapimin.o fpdfapi_jcapistd.o fpdfapi_jccoefct.o fpdfapi_jccolor.o fpdfapi_jcdctmgr.o fpdfapi_jchuff.o fpdfapi_jcinit.o fpdfapi_jcmainct.o fpdfapi_jcmarker.o fpdfapi_jcmaster.o fpdfapi_jcomapi.o fpdfapi_jcparam.o fpdfapi_jcphuff.o fpdfapi_jcprepct.o fpdfapi_jcsample.o fpdfapi_jctrans.o fpdfapi_jdapimin.o fpdfapi_jdapistd.o fpdfapi_jdcoefct.o fpdfapi_jdcolor.o fpdfapi_jddctmgr.o fpdfapi_jdhuff.o fpdfapi_jdinput.o fpdfapi_jdmainct.o fpdfapi_jdmarker.o fpdfapi_jdmaster.o fpdfapi_jdmerge.o fpdfapi_jdphuff.o fpdfapi_jdpostct.o fpdfapi_jdsample.o fpdfapi_jdtrans.o fpdfapi_jerror.o fpdfapi_jfdctfst.o fpdfapi_jfdctint.o fpdfapi_jidctfst.o fpdfapi_jidctint.o fpdfapi_jidctred.o fpdfapi_jmemmgr.o fpdfapi_jmemnobs.o fpdfapi_jutils.o

clean:
	rm -f *.o
	rm -f *.a